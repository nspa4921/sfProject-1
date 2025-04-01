import { LightningElement, wire } from 'lwc';
import getWorkExperiences from '@salesforce/apex/WorkExperienceController.getWorkExperiences';
import getCertificates from '@salesforce/apex/CertificatesController.getCertificates';
import getEducations from '@salesforce/apex/EducationController.getEducations';
import CertificateLogos from '@salesforce/resourceUrl/certificateLogos'; 
import CompanyLogos from '@salesforce/resourceUrl/WorkExperienceImages'; 
import EducationLogos from '@salesforce/resourceUrl/EducationImages'; 
import My_Resource from '@salesforce/resourceUrl/Nemanja_Spasic';
import Nemanja_Cv from '@salesforce/resourceUrl/NemanjaCvPdf'; 

import contactDetails from '@salesforce/label/c.nsContactDetails';
import aboutMeDesc from '@salesforce/label/c.nsAboutMeDesc';
import languagues from '@salesforce/label/c.nsLanguagues';
import cvProfileName from '@salesforce/label/c.nsName';
import location from '@salesforce/label/c.nsLocation';
import role from '@salesforce/label/c.nsRole';

export default class TestComponent extends LightningElement {
    certificatesData = [];
    workExperiences = [];
    educationData = [];
    workExperiencesData;
    certificates;
    education;
    error;
    title;

    expandedIndex = null;
    isLoadingWorkExp = true;
    isLoadingEducation = true;
    isLoadingCertificates = true;

    get myCv(){
        return Nemanja_Cv;
    }

    get profileImageUrl() {
        return My_Resource;
    }

    label = {
        cvProfileName,
        contactDetails,
        aboutMeDesc,
        languagues,
        location,
        role
    };

    @wire(getWorkExperiences)
    wiredWorkExperiences({ error, data }) {
        this.isLoadingWorkExp = false;
        if (data) {
            this.workExperiencesData = data;
            this.title = data.Title__c;
            this.workExperiences = data.map(exp => {
                const fileName = exp.Image_File_Name__c ? exp.Image_File_Name__c.trim() : null;
                
                return {
                    ...exp,
                    imageUrl: fileName 
                        ? `${CompanyLogos}/companyLogo/${fileName}`  
                        : `${CompanyLogos}/companyLogo/default.png`, 
                        isExpanded: false, 
                        showDescription: false,
                        iconName: exp.Icon_Name__c || 'utility:chevrondown', 
                        iconTitle: exp.Icon_Title__c || 'Show more' 
                };
            });
            this.error = undefined;
        } else if (error) {
            console.error('Error fetching work experiences:', error);
            this.error = error;
            this.workExperiences = [];
        }
    }

    @wire(getEducations)
    wiredEducation({ error, data }) {
        this.isLoadingEducation = false;
        if (data) { 
            this.education = data;
            this.educationData = data.map(edu => {
                const fileName = edu.Image_File_Name__c ? edu.Image_File_Name__c.trim() : null;
                
                return {
                    ...edu,
                    imageUrl: fileName 
                        ? `${EducationLogos}/educationLogo/${fileName}`  
                        : `${EducationLogos}/educationLogo/default.png`
                };
            });
        } else if (error) { 
            console.error('Error fetching education:', error);
            this.error = error;
        }
    }

    @wire(getCertificates)
    wiredCertificates({ error, data }) {
        this.isLoadingCertificates = false;
        if (data) { 
            this.certificates = data;
            this.certificatesData = data.map(cert => {
                const fileName = cert.Image_File_Name__c ? cert.Image_File_Name__c.trim() : null;
                
                return {
                    ...cert,
                    imageUrl: fileName 
                        ? `${CertificateLogos}/certificateLogos/${fileName}`  
                        : `${CertificateLogos}/certificateLogos/default.png`
                };
            });
        } else if (error) { 
            console.error('Error fetching certificates:', error);
            this.error = error;
        }
    }

    toggleDescription(event) {
        const index = event.currentTarget.dataset.index;
        this.workExperiences  = this.workExperiences .map((exp, idx) => {
            if (idx === parseInt(index, 10)) {
                const isExpanded = !exp.isExpanded;
                return {
                    ...exp,
                    isExpanded,
                    showDescription: !exp.showDescription,
                    iconName: isExpanded ? 'utility:chevronup' : 'utility:chevrondown',
                    iconTitle: isExpanded ? 'Show less' : 'Show more'
                };
            }
            return exp;
        });
    }

    handleDownload() {
        const link = document.createElement('a');
        link.href = this.myCv;
        link.target = '_blank'; // Open in a new tab
        link.download = 'Nemanja_Spasic_CV.pdf'; // Set the filename
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }

    handlePrint() {
        window.print();
    }
}
