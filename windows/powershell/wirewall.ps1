Set-NetFirewallProfile -Profile Domain,Public,Private -DefaultInboundAction Block -Enabled True
Set-NetFirewallProfile -Profile Domain,Public,Private -DefaultOutboundAction Block -Enabled True
Remove-NetFirewallRule -Name * 
# Inbound rules
New-NetFirewallRule -DisplayName CCDC-KBR-T -Direction Inbound -Action Allow -LocalPort 88 -Protocol TCP
New-NetFirewallRule -DisplayName CCDC-KBR-U -Direction Inbound -Action Allow -LocalPort 88 -Protocol UDP
New-NetFirewallRule -DisplayName CCDC-DNS-T -Direction Inbound -Action Allow -LocalPort 53 -Protocol TCP
New-NetFirewallRule -DisplayName CCDC-DNS-U -Direction Inbound -Action Allow -LocalPort 53 -Protocol UDP
New-NetFirewallRule -DisplayName CCDC-LDAP-T -Direction Inbound -Action Allow -LocalPort 389 -Protocol TCP
New-NetFirewallRule -DisplayName CCDC-LDAP-U -Direction Inbound -Action Allow -LocalPort 389 -Protocol UDP
New-NetFirewallRule -DisplayName CCDC-LDAPS -Direction Inbound -Action Allow -LocalPort 636 -Protocol TCP
New-NetFirewallRule -DisplayName CCDC-GloCat -Direction Inbound -Action Allow -LocalPort 3268 -Protocol TCP
New-NetFirewallRule -DisplayName CCDC-GloCatS -Direction Inbound -Action Allow -LocalPort 3269 -Protocol TCP
New-NetFirewallRule -DisplayName CCDC-ICMP -Direction Inbound -Action Allow -Protocol ICMPv4 -IcmpType Any
New-NetFirewallRule -DisplayName CCDC-SMB -Direction Inbound -Action Allow -LocalPort 445 -Protocol TCP -Enabled False
New-NetFirewallRule -DisplayName CCDC-RPC -Direction Inbound -Action Allow -LocalPort 135 -Protocol TCP -Enabled False

# Outbound rules
New-NetFirewallRule -DisplayName CCDC-HTTP -Direction Outbound -Action Allow -RemotePort 80 -Protocol TCP -Enabled False
New-NetFirewallRule -DisplayName CCDC-HTTPS -Direction Outbound -Action Allow -RemotePort 443 -Protocol TCP -Enabled False
New-NetFirewallRule -DisplayName CCDC-DNS -Direction Outbound -Action Allow -RemotePort 53 -Protocol TCP
New-NetFirewallRule -DisplayName CCDC-ICMP -Direction Outbound -Action Allow -Protocol ICMPv4 -IcmpType Any