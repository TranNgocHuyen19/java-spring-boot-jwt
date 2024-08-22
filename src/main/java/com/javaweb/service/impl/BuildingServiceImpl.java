package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.service.IBuildingService;
import com.javaweb.utils.RentAreaUltis;
import com.javaweb.utils.SplitUltis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingServiceImpl implements IBuildingService {
    @Autowired
    private BuildingRepositoryCustom buildingRepositoryCustom;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingSearchResponseConverter buildingSearchResponseConverter;

    @Autowired
    private BuildingConverter buildingConverter;


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

    @Transactional
    @Override
    public void addOrUpdateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        List<Integer> rentAreas = SplitUltis.splitRentArea(buildingDTO.getRentArea());
        buildingRepository.save(buildingEntity);
        for (Integer it : rentAreas) {
            Long id = buildingEntity.getId();
            RentAreaEntity ra = new RentAreaEntity();
            ra.setBuilding(buildingEntity);
            ra.setValue(it);
            rentAreaRepository.save(ra);
        }
        System.out.println("Success");
    }

    @Transactional
    @Override
    public BuildingDTO findBuildingById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingDTO result = buildingConverter.convertToDTO(buildingEntity);
        return result;
    }

    @Transactional
    @Override
    public void deleteBuildings(List<Long> ids) {
        for (Long id : ids) {
            rentAreaRepository.deleteByBuildingId(id);
        }
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = new ArrayList<>();
        for(AssignmentBuildingEntity it : building.getAssignmentBuildingEntities()) {
            staffAssignment.add(it.getUserEntity());
        }
        ResponseDTO result = new ResponseDTO();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        for(UserEntity it : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssignment.contains(it)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        result.setData(staffResponseDTOS);
        result.setMessage("Success");
        return result;
    }
}
