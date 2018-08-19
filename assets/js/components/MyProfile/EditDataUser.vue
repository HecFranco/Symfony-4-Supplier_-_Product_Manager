<template>
        <div class="col-xl-9 col-lg-8">
          <div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
            <div class="m-portlet__head">
              <div class="m-portlet__head-tools">
                <ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
                  <li class="nav-item m-tabs__item">
                    <a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
                    <i class="flaticon-share m--hide"></i>
                      {{ $t("my_profile.update_profile") }}
                    </a>
                  </li>
                  <li class="nav-item m-tabs__item">
                    <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_3" role="tab">
                      {{ $t("my_profile.settings") }}
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="tab-content">
              <div class="tab-pane active" id="m_user_profile_tab_1">
                <form 
                  class="m-form m-form--fit m-form--label-align-right" 
                  @submit.prevent="validateBeforeSubmit"
                >
                  <div class="m-portlet__body">
                    <div class="form-group m-form__group row">
                      <div class="col-10 ml-auto">
                        <h3 class="m-form__section">
                          1. {{ $t("my_profile.personal_details") }}
                        </h3>
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.first_name") }}
                      </label>
                      <div class="col-9">
                        <input
                          id="myProfileInput_firstname"
                          class="form-control m-input"
                          type="text"
                          v-model="firstName"
                          name="firstName"
                          v-on:input="validateFirstNameString"                       
                        >
                        <span
                          v-show="errors_form.firstName === true"
                          class="text_danger"
                        >    
                          {{ $t("errors_form.string_required") }}
                        </span>                          
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.last_name") }}
                      </label>
                      <div class="col-9">
                        <input
                          id="myProfileInput_lastname"
                          class="form-control m-input"
                          type="text"
                          v-model="lastName"
                          name="lastName"   
                          v-on:input="validateLastNameString"                                                 
                        >
                        <span
                          v-show="errors_form.lastName === true"
                          class="text_danger"
                        >    
                          {{ $t("errors_form.string_required") }}
                        </span>                         
                      </div>
                    </div>       
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.email") }}
                      </label>
                      <div class="col-9">
                        <input
                          id="myProfileInput_email"
                          class="form-control m-input"
                          type="text"
                          v-model="email"
                          name="email"    
                          v-on:input="validateEmail"                                                
                        >
                        <span
                          v-show="errors_form.email === true"
                          class="text_danger"
                        >    
                          {{ $t("errors_form.email_required") }}
                        </span>                          
                      </div>
                    </div>  
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.password") }}
                      </label>
                      <div class="col-9">
                        <input
                          id="myProfileInput_password"
                          class="form-control m-input"
                          type="password"
                          v-model="password"
                          name="password"  
                          v-on:input="validatePassword"                                                   
                        >
                        <span
                          v-show="errors_form.password === true"
                          class="text_danger"
                        >    
                          {{ $t("errors_form.password_required") }}
                        </span>                                            
                      </div>                      
                    </div>    
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.password") }}
                      </label>
                      <div class="col-9">
                        <input
                          id="myProfileInput_password_confirmation"
                          class="form-control m-input"
                          type="password"
                          v-model="passwordConfirmation"
                          name="passwordConfirmation"  
                          v-on:input="validatePasswordConfirmation"                                                  
                        >
                        <span
                          v-show="errors_form.passwordConfirmation === true"
                          class="text_danger"
                        >    
                          {{ $t("errors_form.password_confirmation_confirmed") }}
                        </span>                                            
                      </div>                      
                    </div>                                                    
                  </div>
                  <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions">
                      <div class="row">
                        <div class="col-3"></div>
                        <div class="col-9">
                          <button type="submit" class="btn btn-accent m-btn m-btn--air m-btn--custom">
                          {{ $t("my_profile.save_changes") }}
                          </button>
                          &nbsp;&nbsp;
                          <button type="cancel" class="btn btn-secondary m-btn m-btn--air m-btn--custom" style="color:black;">
                          {{ $t("my_profile.cancel") }}
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
              <div class="tab-pane " id="m_user_profile_tab_2"></div>
              <div class="tab-pane " id="m_user_profile_tab_3"></div>
            </div>
          </div>
        </div>
</template>

<script>
import {mapActions, mapGetters} from 'vuex';
// Types
import * as myProfileTypes from "../../types/myProfile";

export default {
  name: "EditDataUserComponent",
  data(){
    return {
      errors_form: {
        firstName: false,
        lastName : false,
        passwordConfirmation : false,
      },
    }
  },
  props: {
    userData: Object,
  },
  computed: {
    ...mapGetters({
      userEditData: myProfileTypes.USER
    }),
    firstName: {
      get() {
        if(this.userEditData.firstName === null){
          this.$store.commit(myProfileTypes.MUTATE_USER_FIRSTNAME, this.userData.firstName);          
        }
        return this.userEditData.firstName;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_FIRSTNAME, value);
      }
    },
    lastName: {
      get() {
        if(this.userEditData.lastName === null){
          this.$store.commit(myProfileTypes.MUTATE_USER_LASTNAME, this.userData.lastName);          
        }
        return this.userEditData.lastName;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_LASTNAME, value);
      }
    },
    email: {
      get() {
        if(this.userEditData.email === null){
          this.$store.commit(myProfileTypes.MUTATE_USER_EMAIL, this.userData.email);          
        }
        return this.userEditData.email;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_EMAIL, value);
      }
    },   
    password: {
      get() {
        return this.userEditData.password;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_PASSWORD, value);
      }
    },  
    passwordConfirmation: {
      get() {
        return this.userEditData.passwordConfirmation;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_PASSWORD_CONFIRMATION, value);
      }
    },               
  },  
  methods: {
    validateBeforeSubmit() {
      let firstName = document.getElementById('myProfileInput_firstname').value;
      let lastName = document.getElementById('myProfileInput_lastname').value;
      let email = document.getElementById('myProfileInput_email').value;
      let password = document.getElementById('myProfileInput_password').value;
      let passwordConfirmation = document.getElementById('myProfileInput_password_confirmation').value;
      console.log(password, passwordConfirmation);
      if(password !== passwordConfirmation){
        console.log('differents passwords');
        this.errors_form.passwordConfirmation = true ;
        console.log(this.errors);
        // console.log(this.$i18n.locale);
        // console.log(this.$i18n.messages);
      }
    },
    validateFirstNameString(event){
      console.log(event.target);
      if(event.target.value.length < 5){
        this.errors_form.firstName = true;
        event.target.classList.add("input_error");
      }else{
        this.errors_form.firstName = false ;
        event.target.classList.remove("input_error");
      }
    },
    validateLastNameString(event){
      if(event.target.value.length < 5){
        this.errors_form.lastName = true ;
        event.target.classList.add("input_error");
      }else{
        this.errors_form.lastName = false ;
        event.target.classList.remove("input_error");
      }
    },   
    validatePassword(event){
      if(event.target.value.length < 5){
        this.errors_form.lastName = true ;
        event.target.classList.add("input_error");
      }else{
        this.errors_form.lastName = false ;
        event.target.classList.remove("input_error");
      }
    },
    validatePasswordConfirmation(event){
      if(event.target.value.length < 5){
        this.errors_form.lastName = true ;
        event.target.classList.add("input_error");
      }else{
        this.errors_form.lastName = false ;
        event.target.classList.remove("input_error");
      }
    },      
    validateEmail(event){
      if(event.target.value.length < 5){
        this.errors_form.passwordConfirmation = true ;
        event.target.classList.add("input_error");
      }else{
        this.errors_form.passwordConfirmation = false ;
        event.target.classList.remove("input_error");
      }
      //if(event.target.value)
    },    
  }  
};
</script>
<style scoped lang="scss">
.text_danger{
  color:red;
  display:block;
}
.input_error{
  border-color:red;
}
</style>