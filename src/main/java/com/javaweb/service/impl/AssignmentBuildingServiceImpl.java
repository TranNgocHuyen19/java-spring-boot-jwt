package com.javaweb.service.impl;

import com.javaweb.converter.AssignmentBuildingConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.service.IAssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssignmentBuildingServiceImpl implements IAssignmentBuildingService {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private AssignmentBuildingConverter assignmentBuildingConverter;

    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<AssignmentBuildingEntity> viewList = assignmentBuildingConverter.convertToEntity(assignmentBuildingDTO);
        List<AssignmentBuildingEntity> dbList = assignmentBuildingRepository.findByBuildingEntity_Id(assignmentBuildingDTO.getBuildingId());
        assignmentBuildingRepository.deleteAll(dbList);
        assignmentBuildingRepository.saveAll(viewList);
    }
}
