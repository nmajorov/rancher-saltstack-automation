# SUSE Rancher automation with Saltstack

[ SUSE Rancher](https://www.rancher.com/), as a multi-cluster container management platform.

This is an example of saltstack automation for SUSE rancher on top of OpenSUSE Leap 15.5

Following and automating this guide:

https://documentation.suse.com/trd/kubernetes/single-html/kubernetes_ri_rancher-k3s-slemicro/index.html



## TODO

fix kvm chrony issue

create config:

        /etc/chrony.d/kvm.conf

with content:

    # KVM hypervisor PTP time source
    #refclock PHC /dev/ptp0 poll 2 # ptp0 is not present in opnesuse cloud image
    #
    refclock SOCK /var/run/chrony.ttyS0.sock
    

more info can be found here:

https://documentation.suse.com/en-us/smart/network/html/ntp-time-synchronization/index.html

