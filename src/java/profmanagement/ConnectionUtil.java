package profmanagement;

import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import java.sql.DriverManager;
import java.sql.Connection;

/**
 * @author hans
 */
public class ConnectionUtil {
    
    public static String getConnectionURL() {
        
        String fullURL = new String();
        
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();

            // Parse the XML file
            Document document = builder.parse(new File("src/java/profmanagement/config.xml"));  
            
            Element root = document.getDocumentElement();
            
            NodeList databaseList = root.getElementsByTagName("database");
            Node databaseNode = databaseList.item(0); // Assuming there's only one database section

            if (databaseNode.getNodeType() == Node.ELEMENT_NODE) {
                Element databaseElement = (Element) databaseNode;
                String databaseURL = databaseElement.getElementsByTagName("url").item(0).getTextContent();
                String username = databaseElement.getElementsByTagName("user").item(0).getTextContent();
                String password = databaseElement.getElementsByTagName("password").item(0).getTextContent();
                
                fullURL = databaseURL + "&useTimezone=true&serverTimezone=UTC&user=" + username + "&password=" + password;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return fullURL;
    }
    
    public static Connection connect() {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useSSL=false&useTimezone=true&serverTimezone=UTC&user=root&password=12345678");   
            System.out.println("Connection Success!");
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
    
    

}
