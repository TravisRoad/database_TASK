import java.sql.*;

public class Dao {
    // MySQL 8.0 以下版本 - JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://124.70.79.160:3306";

    // MySQL 8.0 以上版本 - JDBC 驱动名及数据库 URL
    //static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    //static final String DB_URL = "jdbc:mysql://localhost:3306/RUNOOB?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";


    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "DB_USER58";
    static final String PASS = "DB_USER58@123";

    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;
        try {
            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);
            // 打开链接
            System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            // 执行查询
            System.out.println("实例化Statement对象...");
            stmt = conn.createStatement();
            String sql;
            sql = "use user58db;";
            stmt.executeQuery(sql);
            sql = "select * from `1tbcell` where CITY='sanxia';";
            ResultSet rs = stmt.executeQuery(sql);
            // 展开结果集数据库
            while (rs.next()) {
                // 通过字段检索
                String city = rs.getString("city");
                String sector_id = rs.getString("sector_id");
                String sector_name = rs.getString("sector_name");

                // 输出数据
                System.out.print("city: " + city);
                System.out.print("  sector_id: " + sector_id);
                System.out.print("  sector_name:" + sector_name);
                System.out.print("\n");
            }
            insert(stmt);
            search(stmt);
            update(stmt);
            delete(stmt);
            // 完成后关闭
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            // 处理 JDBC 错误
            se.printStackTrace();
        } catch (Exception e) {
            // 处理 Class.forName 错误
            e.printStackTrace();
        } finally {
            // 关闭资源
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            }// 什么都不做
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        System.out.println("Goodbye!");
    }

    private static void insert(Statement stmt) throws SQLException {
        String sql;
        sql = "insert into `1tbcell`(city, sector_id, sector_name, enodebid, ENODEB_NAME,EARFCN) values ('beijing', '000001', 'haidian-HLHF-1', 000001, 'haidian-HLHF',1);";
        stmt.executeUpdate(sql);
        System.out.println("insert complete");
    }

    private static void search(Statement stmt) throws SQLException {
        String sql;
        sql = "select distinct ENODEBID, enodeb_name, LONGITUDE " +
                "from `1tbcell` " +
                "where LONGITUDE > 111.5 " +
                "order by LONGITUDE desc;";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            // 通过字段检索
            String ENODEBID = rs.getString("ENODEBID");
            String enodeb_name = rs.getString("enodeb_name");
            String LONGITUDE = rs.getString("LONGITUDE");

            // 输出数据
            System.out.print("ENODEBID: " + ENODEBID);
            System.out.print("\tenodeb_name: " + enodeb_name);
            System.out.print("\tLONGITUDE:" + LONGITUDE);
            System.out.print("\n");
        }
    }

    private static void update(Statement stmt) throws SQLException {
        String sql="update `1tbcell` set EARFCN=12345,pci=32,pss=1,sss=10,tac=10000 where enodebid=1;";
        stmt.executeUpdate(sql);
        sql = "select * from `1tbcell` where enodebid=1";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            String city = rs.getString("CITY");
            String ENODEBID = rs.getString("ENODEBID");
            String enodeb_name = rs.getString("enodeb_name");
            String LONGITUDE = rs.getString("LONGITUDE");

            // 输出数据
            System.out.println("City:" + city);
            System.out.print("\tENODEBID: " + ENODEBID);
            System.out.print("\tenodeb_name: " + enodeb_name);
            System.out.print("\tLONGITUDE:" + LONGITUDE);
            System.out.print("\n");
        }
        System.out.println("update");
    }

    private  static  void delete(Statement stmt) throws SQLException {
        String sql="delete from `1tbcell` where CITY='beijing';";
        stmt.executeUpdate(sql);
        sql = "select * from `1tbcell`;";
        ResultSet rs = stmt.executeQuery(sql);
        stmt.executeQuery(sql);
        while (rs.next()) {
            String city = rs.getString("CITY");
            String ENODEBID = rs.getString("ENODEBID");
            String enodeb_name = rs.getString("enodeb_name");
            String LONGITUDE = rs.getString("LONGITUDE");

            // 输出数据
            System.out.println("City:" + city);
            System.out.print("\tENODEBID: " + ENODEBID);
            System.out.print("\tenodeb_name: " + enodeb_name);
            System.out.print("\tLONGITUDE:" + LONGITUDE);
            System.out.print("\n");
        }
    }
}

