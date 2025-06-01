d1: Vlancreation + dhcp + svi
config t
vlan 12
 name VLAN12.com
 exit
Int vlan 12
 no shut
 ip add 10.0.0.129 255.255.255.128
 ip ospf 1 area 0
ip dhcp excluded-add 10.0.0.129 10.0.0.139
ip dhcp pool VLAN12.com
 network 10.0.0.128 255.255.255.128
 default-router 10.0.0.129
 domain-name VLAN12.com
 
 @a2
 config t
 Int e1/0
 switchport mode access
  switchport access vlan 12
  do sh ip dhcp binding

  @p2
  config t
  int e 1/0
  no shut
  ip address dhcp