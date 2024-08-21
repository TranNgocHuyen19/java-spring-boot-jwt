    package com.javaweb.converter;

    import com.javaweb.entity.BuildingEntity;
    import com.javaweb.model.dto.BuildingDTO;
    import com.javaweb.utils.SplitUltis;
    import org.modelmapper.ModelMapper;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Component;

    import java.util.List;
    import java.util.stream.Collectors;

    @Component
    public class BuildingConverter {
        @Autowired
        private ModelMapper modelMapper;

        public BuildingEntity convertToEntity(BuildingDTO buildingDTO) {
            if(buildingDTO.getBrokerageFee().trim().equals(""))
                buildingDTO.setBrokerageFee(null);
            BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
            List<String> typeCode = buildingDTO.getTypeCode();
            String typeCodeResult = typeCode.stream()
                    .collect(Collectors.joining(","));
            buildingEntity.setType(typeCodeResult);
            return buildingEntity;
        }

        public BuildingDTO convertToDTO(BuildingEntity buildingEntity) {
            BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
            List<String> typeCode = SplitUltis.splitTypeCode(buildingEntity.getType());
            buildingDTO.setTypeCode(typeCode);
            return buildingDTO;
        }
    }
