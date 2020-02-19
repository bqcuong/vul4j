package vn.mavn.patientservice.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.mavn.patientservice.dto.DoctorAddDto;
import vn.mavn.patientservice.dto.DoctorEditDto;
import vn.mavn.patientservice.entity.Doctor;

public interface DoctorService {

  Doctor save(DoctorAddDto data);

  Doctor update(DoctorEditDto data);

  Doctor findById(Long id);

  Page<Doctor> findAllDoctors(String name, Pageable pageable);

  void delete(Long id);
}
