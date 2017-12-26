`java -classpath *.jar org.package.PrintClassPath`

### Mock specific list structure with easymock
EasyMock.<List<MyType>> anyObject()

# 使用 keytool
https://docs.oracle.com/cd/E35976_01/server.740/es_admin/src/tadm_ssl_convert_pem_to_jks.html

## CACert.pem to truststore.jks
keytool -importcert -trustcacerts -file ca.crt  -keystore truststore.jks

## Client.pem to keystore.ks
openssl pkcs12 -export -out eneCert.pkcs12 -in client.pem
keytool -v -importkeystore -srckeystore eneCert.pkcs12 -srcstoretype PKCS12 -destkeystore keystore.ks -deststoretype JKS

## 设置环境变量
```
System.setProperty("javax.net.ssl.trustStore", "truststore.jks")
System.setProperty("javax.net.ssl.trustStorePassword", "123456")
System.setProperty("javax.net.ssl.keyStore", "keystore.ks")
System.setProperty("javax.net.ssl.keyStorePassword", "123456")
```

## remote 断点调试
增加 `-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005` 参数

#### 查看线程
jstack 31134

#### List vs Collection

http://stackoverflow.com/questions/3317381/what-is-the-difference-between-collection-and-list-in-java

## Find java home
https://stackoverflow.com/questions/11936685/how-to-obtain-the-location-of-cacerts-of-the-default-java-installation

1. macos `/usr/libexec/java_home`
2. linux `readlink -f /usr/bin/java | sed "s:/jre/bin/java::"`

## Unarchive jar
jar xf jar-file
