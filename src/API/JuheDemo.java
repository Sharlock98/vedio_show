package API;

import net.sf.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 *影讯API合集调用示例代码 － 聚合数据
 *在线接口文档：http://www.juhe.cn/docs/42
 **/

public class JuheDemo {
    public static final String DEF_CHATSET = "UTF-8";
    public static final int DEF_CONN_TIMEOUT = 30000;
    public static final int DEF_READ_TIMEOUT = 30000;
    public static String userAgent =  "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";

    //配置您申请的KEY
    public static final String APPKEY ="cfc61fb35fe4b79555cff3517236603c";
    //1.按关键字检索影片信息
    public static String getRequest1(String vedioName){
        String result =null;
        String url ="http://v.juhe.cn/movie/index";//请求接口地址
        Map params = new HashMap();//请求参数
        params.put("title",vedioName);//需要检索的影片标题,utf8编码的urlencode
        params.put("smode",0);//<font color=red>是否精确查找，精确:1 模糊:0  默认1</font>
        params.put("pagesize",50);//<font color=red>每次返回条数，默认20,最大50</font>
        params.put("offset",0);//<font color=red>偏移量，默认0,最大760</font>
        params.put("key",APPKEY);//应用APPKEY(应用详细页查询)
        params.put("dtype","json");//返回数据的格式,xml/json，默认json

        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
                System.out.println(object.getJSONArray("result").getJSONObject(0).getString("rating"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
            return object.getJSONArray("result").getJSONObject(0).getString("rating");
        } catch (Exception e) {
            e.printStackTrace();
        }
        String e="该影片暂无评分";
        return e;
    }
    public static void main(String[] args) {
        System.out.println(JuheDemo.getRequest1("天泪传奇"));
    }

    /**
     *
     * @param strUrl 请求地址
     * @param params 请求参数
     * @param method 请求方法
     * @return  网络请求字符串
     * @throws Exception
     */
    public static String net(String strUrl, Map params,String method) throws Exception {
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        String rs = null;
        try {
            StringBuffer sb = new StringBuffer();
            if(method==null || method.equals("GET")){
                strUrl = strUrl+"?"+urlencode(params);
            }
            URL url = new URL(strUrl);
            conn = (HttpURLConnection) url.openConnection();
            if(method==null || method.equals("GET")){
                conn.setRequestMethod("GET");
            }else{
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);
            }
            conn.setRequestProperty("User-agent", userAgent);
            conn.setUseCaches(false);
            conn.setConnectTimeout(DEF_CONN_TIMEOUT);
            conn.setReadTimeout(DEF_READ_TIMEOUT);
            conn.setInstanceFollowRedirects(false);
            conn.connect();
            if (params!= null && method.equals("POST")) {
                try {
                    DataOutputStream out = new DataOutputStream(conn.getOutputStream());
                    out.writeBytes(urlencode(params));
                } catch (Exception e) {
                    // TODO: handle exception
                }
            }
            InputStream is = conn.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, DEF_CHATSET));
            String strRead = null;
            while ((strRead = reader.readLine()) != null) {
                sb.append(strRead);
            }
            rs = sb.toString();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                reader.close();
            }
            if (conn != null) {
                conn.disconnect();
            }
        }
        return rs;
    }

    //将map型转为请求参数型
    public static String urlencode(Map<String,Object>data) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry i : data.entrySet()) {
            try {
                sb.append(i.getKey()).append("=").append(URLEncoder.encode(i.getValue()+"","UTF-8")).append("&");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }
}
