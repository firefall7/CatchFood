package com.catchfood.service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

@Service
public class IamportService {

    private final String API_KEY = "3860773156458060";
    private final String API_SECRET = "V8JZRW9rSYXz1ZmyNgjHb1ZnOo4zEnIzGPL0JCcDsJnMh0T3RmTrP4CS2rkINrHbrINP7cSD7zjA83Kf";

    // 1. 토큰 요청
    public String getToken() throws Exception {
        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        String jsonBody = "{\"imp_key\":\"" + API_KEY + "\",\"imp_secret\":\"" + API_SECRET + "\"}";

        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonBody.getBytes("UTF-8"));
            os.flush();
        }

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }

        // 문자열 파싱 (토큰 부분만 추출)
        String result = sb.toString();
        int start = result.indexOf("\"access_token\":\"") + 16;
        int end = result.indexOf("\"", start);
        return result.substring(start, end);
    }

    // 2. 환불 요청
    public void cancelPayment(String impUid) throws Exception {
        String token = getToken();

        URL url = new URL("https://api.iamport.kr/payments/cancel");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", token);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        String jsonBody = "{\"imp_uid\":\"" + impUid + "\"}";

        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonBody.getBytes("UTF-8"));
            os.flush();
        }

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }

        System.out.println("아임포트 환불 결과: " + sb.toString());
    }
}