<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Certificates</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .certificate-container {
            margin-top: 20px;
        }
        .certificate-item {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 10px;
        }
        .certificate-item img {
            max-width: 100%;
            height: auto;
        }
        .certificate-item a {
            display: inline-block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>View Certificates</h2>
        <div class="form-group">
            <label for="userId">Enter User ID:</label>
            <input type="text" id="userId" class="form-control" placeholder="Enter User ID">
        </div>
        <button class="btn btn-primary" onclick="fetchCertificates()">View Certificates</button>

        <div id="certificates" class="certificate-container"></div>
    </div>

    <script type="text/javascript">
        // Function to render either the image or the PDF link based on file type
        function renderCertificate(cert) {
            if (cert.fileType.startsWith("image")) {
                // If it's an image, create an image element
                return <img src="data:${cert.fileType};base64,${cert.image}" alt="${cert.name}" />;
            } else if (cert.fileType === "application/pdf") {
                // If it's a PDF, create a link to download the PDF
                return <a href="data:${cert.fileType};base64,${cert.image}" download="${cert.name}">Download PDF</a>;
            } else {
                return <p>Unknown file type: ${cert.fileType}</p>;
            }
        }

        // Function to fetch certificates based on User ID
         async function fetchCertificates() {
            const userId = document.getElementById("userId").value.trim();
            console.log("User ID:", userId); // Debugging step

            // Validate the User ID
            if (!userId || isNaN(userId)) {
                alert("Please enter a valid User ID.");
                return;
            }

            try {
                // Fetch the certificates for the entered User ID
                const response = await fetch(http://localhost:8080/certificate/view?userId=${userId});
                if (!response.ok) {
                    throw new Error(Error: ${response.status} - ${response.statusText});
                }
                const certificates = await response.json();

                const container = document.getElementById("certificates");
                container.innerHTML = "";  // Clear any existing certificates

                // Loop through the certificates and render them
                certificates.forEach(cert => {
                    const div = document.createElement("div");
                    div.classList.add("certificate-item");

                    // Create HTML for certificate details
                    div.innerHTML = `
                        <p><strong>Name:</strong> ${cert.name}</p>
                        <p><strong>Status:</strong> ${cert.status}</p>
                        if (cert.fileType.startsWith("image")) {
                            // If it's an image, create an image element
                            return <img src="data:${cert.fileType};base64,${cert.image}" alt="${cert.name}" />;
                        } else if (cert.fileType === "application/pdf") {
                            // If it's a PDF, create a link to download the PDF
                            return <a href="data:${cert.fileType};base64,${cert.image}" download="${cert.name}">Download PDF</a>;
                        } else {
                            return <p>Unknown file type: ${cert.fileType}</p>;
                        }}
                    `;
                    container.appendChild(div);
                });
            } catch (error) {
                console.error("Error fetching certificates:", error);
                alert("Failed to fetch certificates. Please check the User ID and try again.");
            }
        }
    </script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>