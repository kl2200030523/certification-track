package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import klu.model.Certificate;
import klu.model.CertificateManager;

import java.util.List;

@RestController
@RequestMapping("/certificate")
public class CertificateController {

    @Autowired
    private CertificateManager certificateManager;

    @PostMapping("/upload")
    public String uploadCertificate(@RequestParam("file") MultipartFile file, @RequestParam("userId") Long userId) {
        return certificateManager.uploadCertificate(file, userId);
    }

    @GetMapping("/view")
    public ResponseEntity<List<Certificate>> viewCertificates(@RequestParam("userId") Long userId) {
        if (userId == null || userId <= 0) {
            return ResponseEntity.badRequest().build();
        }
        try {
            List<Certificate> certificates = certificateManager.getUserCertificates(userId);
            return ResponseEntity.ok(certificates); // Return empty list if no certificates found
        } catch (Exception e) {
            // Log the exception (optional)
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // Handle unexpected errors
        }
    }


    @GetMapping("/download/{id}")
    public ResponseEntity<byte[]> downloadCertificate(@PathVariable Long id) {
        Certificate certificate = certificateManager.getCertificateById(id);
        if (certificate != null && certificate.getImage() != null) {
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "attachment; filename=" + certificate.getName());
            headers.add("Content-Type", certificate.getFileType()); // Set MIME type
            return new ResponseEntity<>(certificate.getImage(), headers, HttpStatus.OK);
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }
}