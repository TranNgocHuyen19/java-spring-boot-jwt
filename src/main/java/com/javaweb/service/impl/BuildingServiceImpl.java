package com.javaweb.service.impl;

import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class BuildingServiceImpl implements IBuildingService {
    @Autowired
    private BuildingRepositoryCustom buildingRepositoryCustom;

    @Autowired
    private BuildingSearchResponseConverter buildingSearchResponseConverter;

    @Override
    public List<BuildingSearchResponse> findByCriteria(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingEntity> list = buildingRepositoryCustom.findByCriteria(buildingSearchRequest);
        List<BuildingSearchResponse> responseList = new ArrayList<>();
        for (BuildingEntity item : list) {
            BuildingSearchResponse buildingSearchResponse = buildingSearchResponseConverter.toBuildingSearchResponse(item);
            responseList.add(buildingSearchResponse);
        }
        return responseList;
    }
}
