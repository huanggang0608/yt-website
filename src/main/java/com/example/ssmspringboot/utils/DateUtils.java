package com.example.ssmspringboot.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    /**
     * 将日期转换成String
     * @param date
     * @return
     */
    public static String getDate(Date date){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String dateS=sdf.format(date);
        return dateS;
    }
}
