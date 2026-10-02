# Create namespaces
ip netns add host-a
ip netns add host-b
ip netns add router

# veth pairs: host-a <-> router, host-b <-> router
ip link add veth-a type veth peer name veth-a-r
ip link add veth-b type veth peer name veth-b-r

ip link set veth-a netns host-a
ip link set veth-a-r netns router
ip link set veth-b netns host-b
ip link set veth-b-r netns router

# Assign IPs
ip netns exec host-a ip addr add 192.168.10.2/24 dev veth-a
ip netns exec router ip addr add 192.168.10.1/24 dev veth-a-r
ip netns exec host-b ip addr add 192.168.20.2/24 dev veth-b
ip netns exec router ip addr add 192.168.20.1/24 dev veth-b-r

# Bring interfaces up
for ns in host-a host-b router; do ip netns exec $ns ip link set lo up; done
ip netns exec host-a ip link set veth-a up
ip netns exec router ip link set veth-a-r up
ip netns exec host-b ip link set veth-b up
ip netns exec router ip link set veth-b-r up

# Enable forwarding in router namespace
ip netns exec router sysctl -w net.ipv4.ip_forward=1

# Default routes on hosts pointing to router
ip netns exec host-a ip route add default via 192.168.10.1
ip netns exec host-b ip route add default via 192.168.20.1
