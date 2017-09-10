package ca.esystem.framework.util;

import sun.misc.BASE64Decoder;  
import sun.misc.BASE64Encoder;  
  
/** * BASE64加密解密 */  
public class Base64Encrypt {  
    /** * BASE64解密 * @param key * @return * @throws Exception */  
    public static byte[] decryptBASE64(String key) throws Exception {  
        return (new BASE64Decoder()).decodeBuffer(key);  
    }  
  
    /** * BASE64加密 * @param key * @return * @throws Exception */  
    public static String encryptBASE64(byte[] key) throws Exception {  
        return (new BASE64Encoder()).encodeBuffer(key);  
    }  
  
    public static void main(String[] args) throws Exception {  
        String data = Base64Encrypt.encryptBASE64("2053".getBytes());  
        System.out.println("加密前：" + data);  
        byte[] byteArray = Base64Encrypt.decryptBASE64(data);  
        System.out.println("解密后：" + new String(byteArray));  
    }  
}  
