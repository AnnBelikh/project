package kyrs;

import com.mongodb.BasicDBObject;
import java.sql.*;
import java.util.*;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Set;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.ReadPreference;
import static com.mongodb.ReadPreference.secondary;
import com.mongodb.ServerAddress;
import org.apache.catalina.User;

public class Database
{   
   
    // регистрация нового пользователя
    public String registerNewUser(String login, String my_name, String pwd)
            throws SQLException
    {
        String registrationResults = "Поздравляем," + login+ "! Регистрация прошла успешно!";
        MongoClient mongoClient = null;
        try
        {
            List<ServerAddress> seeds = new ArrayList<ServerAddress>();
            seeds.add(new ServerAddress("localhost", 27001));
            seeds.add(new ServerAddress("localhost", 27002));
            seeds.add(new ServerAddress("localhost", 27003));
 
            mongoClient = new MongoClient(seeds);
        
            DB db = mongoClient.getDB("test");
            DBCollection user = db.getCollection("user");
            DBCollection result = db.getCollection("result");
                    
            BasicDBObject document = new BasicDBObject();
            BasicDBObject document2 = new BasicDBObject();
            document.put("_id", login);
            document.put("name", my_name);
            document.put("pass", pwd);
            document2.put("_id", login);
            document2.put("res", "Вы еще не прошли тест!");
            user.insert(document);
            result.insert(document2);
        }
            catch (Exception e)
        {
            registrationResults = "Такой пользователь уже есть";
        }
        finally
        {
            mongoClient.close();
            return registrationResults;
        }
}

    String SetData(String login, int a) {
        String registrationResults = "";
        MongoClient mongoClient = null;
        try
        {
            List<ServerAddress> seeds = new ArrayList<ServerAddress>();
            seeds.add(new ServerAddress("localhost", 27001));
            seeds.add(new ServerAddress("localhost", 27002));
            seeds.add(new ServerAddress("localhost", 27003));
 
            mongoClient = new MongoClient(seeds);            
            String b = ""+a;
            
            DB db = mongoClient.getDB("test");
            DBCollection results = db.getCollection("result");
            
            BasicDBObject newData = new BasicDBObject();
            newData.put("_id", login);
            newData.put("res", b);
            
            results.update(new BasicDBObject().append("_id", login), newData);
        }
        catch (Exception e) { registrationResults = "Ошибка при записи в базу данных. Пройдите тест еще раз, пожалуйста :)";}
        finally
        {
            mongoClient.close();
            return registrationResults;
        }
    }

    boolean isUserValid(String login, String pwd) {
        MongoClient mongoClient = null;
        boolean result = false;
        String a ="";
        try
        {
            List<ServerAddress> seeds = new ArrayList<ServerAddress>();
            seeds.add(new ServerAddress("localhost", 27001));
            seeds.add(new ServerAddress("localhost", 27002));
            seeds.add(new ServerAddress("localhost", 27003));
 
            mongoClient = new MongoClient(seeds);
        
            DB db = mongoClient.getDB("test");
            DBCollection user = db.getCollection("user");
            db.setReadPreference(ReadPreference.secondaryPreferred());
            BasicDBObject document = new BasicDBObject();
                        
            document.put("_id", login);
            DBObject res = user.findOne(document);

            a = (String) res.get("pass");
            
            if (a.equals(pwd))
            {
                result = true;
            }

        }
        catch (Exception e) {}
        finally
        {
            mongoClient.close();
            return result;
        }
    }

    String GetResalt(String login) {
        MongoClient mongoClient = null;
        String a="";
        String b="";
        try
        {
            List<ServerAddress> seeds = new ArrayList<ServerAddress>();
            seeds.add(new ServerAddress("localhost", 27001));
            seeds.add(new ServerAddress("localhost", 27002));
            seeds.add(new ServerAddress("localhost", 27003));
 
            mongoClient = new MongoClient(seeds);
        
            DB db = mongoClient.getDB("test");
            db.setReadPreference(ReadPreference.secondaryPreferred());
            DBCollection result = db.getCollection("result");
            BasicDBObject document = new BasicDBObject();
                        
            document.put("_id", login);
            DBObject results = result.findOne(document);
            a = (String) results.get("res");
            
            if ("Вы еще не прошли тест!".equals(a))
            {
            b=a;
            }
            else
            {
            DBCollection test_res = db.getCollection("test_res");
            BasicDBObject document2 = new BasicDBObject();
            
            document2.put("_id", a);
            DBObject results2 = test_res.findOne(document2);
            b = (String) results2.get("text");
            }
           
        }
        catch (Exception e) 
        {
            b = "Простите, ошибка подключения к базе.";
        }
        finally
        {
            mongoClient.close();
            return b;
        }
    }

        
        
}


