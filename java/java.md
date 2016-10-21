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
