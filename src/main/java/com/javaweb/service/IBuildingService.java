package com.javaweb.service;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface IBuildingService {
    List<BuildingSearchResponse> findByCriteria(BuildingSearchRequest buildingSearchRequest);
    void addOrUpdateBuilding(BuildingDTO buildingDTO);
    BuildingDTO findBuildingById(Long id);
    void deleteBuildings(List<Long> ids);
    ResponseDTO listStaffs(Long buildingId);
}
