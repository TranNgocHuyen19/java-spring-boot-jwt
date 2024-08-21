package com.javaweb.utils;

import java.util.ArrayList;
import java.util.List;

public class RentAreaUltis {
    public static List<Integer> splitRentArea(String rentArea) {
        List<Integer> result = new ArrayList<>();
//        100,200,300
        int size = rentArea.split(",").length;
        for(int i = 0; i < size; i++) {
            if(NumberUtils.isLong(rentArea.split(",")[i])) {
                result.add(Integer.parseInt(rentArea.split(",")[i]));
            }
        }
        return result;
    }
}
