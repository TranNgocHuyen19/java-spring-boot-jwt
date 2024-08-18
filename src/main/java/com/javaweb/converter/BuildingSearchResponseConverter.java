package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.utils.DistrictCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingSearchResponseConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        String districtName = DistrictCode.valueOf(buildingEntity.getDistrict()).getDistrictName();
        buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " +  districtName);
        List<RentAreaEntity> areaEntities = buildingEntity.getRentAreaEntities();
        String areaResult = areaEntities.stream()
                .map(it -> it.getValue().toString())
                .collect(Collectors.joining(","));
        buildingSearchResponse.setRentArea(areaResult);
        return buildingSearchResponse;
    }
}
