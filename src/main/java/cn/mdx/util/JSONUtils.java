package cn.mdx.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class JSONUtils
{
/**
 *
 * @author wangwei JSON工具类
 * @param <T>
 *
 */
    /***
     * 将List对象序列化为JSON文本
     */

    public static String aliToJSONString(Object o){
        return JSON.toJSONString(o);
    }
    
    public static String aliToJsonString(Object o,Object obj){
    	return JSON.toJSONString(o)+ JSON.toJSONString(obj);
    	}

    public static JSONObject receivePost(HttpServletRequest request) throws IOException{

        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream(),"utf-8"));
        String line = null;
        StringBuilder sb = new StringBuilder();
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }
        System.out.println(sb.toString());
        return JSONObject.parseObject(sb.toString());
    }
}
