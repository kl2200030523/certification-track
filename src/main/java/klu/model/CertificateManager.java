package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import klu.repository.CertificateRepository;

import java.io.IOException;
import java.util.List;

@Service
public class CertificateManager {

    @Autowired
    private CertificateRepository certificateRepository;

    public String uploadCertificate(MultipartFile file, Long userId) {
        try {
            Certificate certificate = new Certificate();
            certificate.setName(file.getOriginalFilename());
            certificate.setStatus("Uploaded");
            certificate.setUserId(userId);
            certificate.setFileType(file.getContentType()); // Save MIME type
            certificate.setImage(file.getBytes());
            certificateRepository.save(certificate);
            return "Certificate uploaded successfully!";
        } catch (IOException e) {
            return "Error uploading certificate: " + e.getMessage();
        }
    }

    public List<Certificate> getUserCertificates(Long userId) {
        return certificateRepository.findByUserId(userId);
    }

    public Certificate getCertificateById(Long id) {
        return certificateRepository.findById(id).orElse(null);
    }
}
