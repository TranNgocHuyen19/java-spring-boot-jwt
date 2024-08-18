package com.javaweb.service;

import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;

import java.util.List;

public interface IBuildingService {
    List<BuildingSearchResponse> findByCriteria(BuildingSearchRequest buildingSearchRequest);
}
