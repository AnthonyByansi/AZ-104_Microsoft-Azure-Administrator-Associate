## **Hosting Static Websites with Azure Blob Storage**

Azure Blob Storage simplifies static website hosting, offering scalable and cost-effective hosting for HTML, CSS, JavaScript, and other static assets.  

---

#### **Features**  
- **Custom Domains:** Integrate with your own domain for branding.  
- **HTTPS Support:** Secure communication with built-in SSL.  
- **Global Reach:** Low latency via Azure’s global data center network.  

---

#### **Setup Guide**  

1. **Enable Static Website Hosting:**  
   - In the Azure portal, go to your storage account.  
   - Navigate to **Static Website** under **Data Management** and click **Enable**.  
   - Set the **index document** (e.g., `index.html`) and optionally a custom error page (e.g., `404.html`).  

2. **Upload Content:**  
   - Upload your website files to the `$web` container.  

3. **Access Your Website:**  
   - Use the provided primary endpoint (e.g., `https://<storage_account>.z6.web.core.windows.net`).  

---

#### **Custom Domain Configuration**  

1. Configure a CNAME record in your DNS provider pointing to the storage account URL.  
2. Use Azure Front Door or Azure CDN to improve performance and add SSL.  

---

#### **Example Use Cases**

| **Use Case**                     | **Details**                                                                                   |
|-----------------------------------|-----------------------------------------------------------------------------------------------|
| **Portfolio Website**             | Host your personal portfolio with custom branding and global availability.                    |
| **Documentation Site**            | Publish static documentation with markdown-based generators like Jekyll or Hugo.             |
| **Marketing Pages**               | Deploy marketing content quickly with CDN-backed delivery for performance.                   |

---

#### **Learn More**  
- [Static Website Hosting Documentation](https://learn.microsoft.com/azure/storage/blobs/storage-blob-static-website?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)  
- [Custom Domain and HTTPS Guide](https://learn.microsoft.com/azure/storage/blobs/storage-custom-domain-name?tabs=azure-portal&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)  
- [Azure Front Door Overview](https://learn.microsoft.com/azure/frontdoor/front-door-overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)  
