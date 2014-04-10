openssl-heartbleed-fix
======================

OpenSSL Heartbleed (CVE-2014-0160) Fix script

Sammy Fung <sammy@sammy.hk>

OpenSSL Heartbleed ([CVE-2014-0160] (http://www.us-cert.gov/ncas/alerts/TA14-098A)) bug is now discovered by network security professionals, which many systems using some OpenSSL versions are affected.

In theory, it is assumed that SSL certificates on many web servers are affected, so it is also suggested to generate a new SSL certificate with fixed version of OpenSSL.

To summerize the fix procedure, we should upgrade OpenSSL with apt-get or yum on Linux systems, and then we should confirm build date of OpenSSL is 2014/4/7 or later.

$ apt-get update && apt-get install -y libssl1.0.0 openssl

And then generate a new SSL certificate for Apache HTTP web server, after that we restart Apache httpd to get it done.

$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem

It is not as simple as normal bugfix, so you are suggested to read the following blog posts (English and Chinese). 

A shell script openssl-heartbleed-fix.sh is written according to my English detail blog post to this bug. You can download this git repo or the shell script, read the code and run it if you understand what the script do.

Enquiry and Support
-------------------

For any questsions, you can contact with me.

Blog
----
* [Fixing Linux Systems with OpenSSL Heartbleed (CVE-2014-0160)] (http://www.linuxharbour.com/fixing-linux-systems-with-openssl-heartbleed-cve-2014-0160/)
* [OpenSSL Heartbleed (CVE-2014-0160) 解決方法] (http://sammy.hk/openssl-heartbleed-cve-2014-0160-solution/)
