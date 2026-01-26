import { LightningElement, wire } from 'lwc';
import getWorkExperiences from '@salesforce/apex/WorkExperienceController.getWorkExperiences';

workExperiences = [];
error;

export default class NsCurriculumVitae extends LightningElement {

             
    @wire(getWorkExperiences)
    workExperience({ error, data})  {   
        if (data) {
            this.workExperiences = data;
            console.log('Work Experiences:', this.workExperiences);
        } else if (error) {
            this.error = error;
        }
    }
}