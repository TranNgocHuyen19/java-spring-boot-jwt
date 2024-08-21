package com.javaweb.utils;

import java.util.ArrayList;
import java.util.List;

public class SplitUltis {
    public static List<Integer> splitRentArea(String rentArea) {
        List<Integer> result = new ArrayList<>();
        int size = rentArea.split(",").length;
        for(int i = 0; i < size; i++) {
            if(NumberUtils.isLong(rentArea.split(",")[i])) {
                result.add(Integer.parseInt(rentArea.split(",")[i]));
            }
        }
        return result;
    }

    public static List<String> splitTypeCode(String typeCode) {
        List<String> result = new ArrayList<>();
        int size = typeCode.split(",").length;
        for(int i = 0; i < size; i++) {
            result.add(typeCode.split(",")[i]);
        }
        return result;
    }
}
