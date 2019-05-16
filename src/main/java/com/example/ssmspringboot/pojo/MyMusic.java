package com.example.ssmspringboot.pojo;


public class MyMusic {
    public static String[][] arraymusic = new String[10][2];

    public int lowLength;
    public int linelength;
    public static String getmusicname(int index, int index2)
    {
        return arraymusic[index][index2];
    }

    public int getlowLength()
    {
        return arraymusic.length;
    }

    public int getlinelength()
    {
        return arraymusic[0].length;
    }
}
