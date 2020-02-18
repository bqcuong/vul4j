package vn.mavn.patientservice.service.impl;

import java.util.Collections;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.mavn.patientservice.dto.AdvertisingSourceAddDto;
import vn.mavn.patientservice.dto.AdvertisingSourceEditDto;
import vn.mavn.patientservice.entity.AdvertisingSource;
import vn.mavn.patientservice.exception.ConflictException;
import vn.mavn.patientservice.exception.NotFoundException;
import vn.mavn.patientservice.repository.AdvertisingSourceRepository;
import vn.mavn.patientservice.service.AdvertisingSourceService;

@Service
public class AdvertisingSourceServiceImpl implements AdvertisingSourceService {

  @Autowired
  private AdvertisingSourceRepository advertisingSourceRepository;

  @Override
  public AdvertisingSource addNew(AdvertisingSourceAddDto advertisingSourceAddDto) {
    //TODO: valid name duplicate
    advertisingSourceRepository.findByName(advertisingSourceAddDto.getName().trim().toUpperCase())
        .ifPresent(adver -> {
          throw new ConflictException(Collections.singletonList("err-advertising-duplicate-name"));
        });
    AdvertisingSource advertisingSource = AdvertisingSource.builder()
        .description(advertisingSourceAddDto.getDescription())
        .name(advertisingSourceAddDto.getName().trim()).build();
    advertisingSource.setCreatedBy(advertisingSourceAddDto.getCreatedBy());
    advertisingSource.setUpdatedBy(advertisingSourceAddDto.getCreatedBy());
    return advertisingSourceRepository.save(advertisingSource);
  }

  @Override
  public AdvertisingSource editAdvertSource(AdvertisingSourceEditDto advertisingSourceEditDto) {
    //TODO: check exist advertising_source
    AdvertisingSource advertisingSource = advertisingSourceRepository
        .findById(advertisingSourceEditDto.getId()).orElseThrow(() -> new NotFoundException(
            Collections.singletonList("err-advertising-not-found")));
    //TODO: valid name duplicate
    advertisingSourceRepository
        .findByNameNotEqualId(advertisingSourceEditDto.getName().trim().toUpperCase(),
            advertisingSourceEditDto.getId())
        .ifPresent(advert -> {
          throw new ConflictException(Collections.singletonList("err-advertising-duplicate-name"));
        });
    BeanUtils.copyProperties(advertisingSourceEditDto, advertisingSource);
    return advertisingSourceRepository.save(advertisingSource);
  }
}
