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
                          v-bind:class="{ input_error: errors.has('firstName') }"
                          type="text"
                          v-model="firstname"
                          name="firstName" 
                          v-validate
                          data-vv-rules="alpha"                     
                        >
                        <span
                          v-show="errors.has('firstName')"
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
                          v-bind:class="{ input_error: errors.has('lastName') }"
                          type="text"
                          v-model="lastname"
                          name="lastName" 
                          v-validate
                          data-vv-rules="alpha"                                                
                        >
                        <span
                          v-show="errors.has('lastName')"
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
                          v-bind:class="{ input_error: errors.has('email') }"
                          type="text"
                          v-model="email"
                          name="email"     
                          v-validate
                          data-vv-rules="required|email"                                                                       
                        >                       
                        <span
                          v-show="errors.has('email')"
                          class="text_danger"
                        >    
                          {{ $t("errors_form.email_required") }}
                        </span>                          
                      </div>
                    </div>  
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.birthdate") }}
                      </label>
                      <div class="col-9">                    
                        <datepicker-component 
                          id="birthdate"
                          v-model = "birthdate" 
                          name = "dateFormatFieldBirthdate"
                          v-bind:class="{ input_error: errors.has('dateFormatFieldBirthdate') }"
                          type = "date"
                          lang = "es"
                          format = "DD/MM/YYYY"
                          v-validate = "'date_format:DD/MM/YYYY'"
                        >
                        </datepicker-component>                 
                        <span
                          v-show="errors.has('dateFormatFieldBirthdate')"
                          class="text_danger"
                        >    
                          {{ $t("errors_form.date_format") }}
                        </span>                          
                      </div>                      
                    </div>   
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.password") }}
                      </label>
                      <div class="col-9">
                        <input
                          autocomplete="off"
                          id="myProfileInput_password"
                          class="form-control m-input"
                          v-bind:class="{ input_error: errors.has('password') }"
                          type="password"
                          v-model="password"
                          name="password"    
                          v-validate
                          data-vv-rules="required|min:4"
                          ref="password"                                                                          
                        >                      
                        <span
                          v-show="errors.has('password')"
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
                          autocomplete="off"
                          id="myProfileInput_password_confirmation"
                          class="form-control m-input"
                          v-bind:class="{ input_error: errors.has('passwordConfirmation') }"
                          type="password"
                          v-model="passwordConfirmation"
                          name="passwordConfirmation"     
                          v-validate="'required|confirmed:password'"                                                                         
                        >                      
                        <span
                          v-show="errors.has('passwordConfirmation')"
                          class="text_danger"
                        >    
                          {{ $t("errors_form.password_confirmation_confirmed") }}
                        </span>                                            
                      </div>                      
                    </div>  
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.image") }}
                      </label>
                      <div class="col-9">
                        <vue-dropzone-component 
                          ref="dropzoneImage"
                          id="dropzone" 
                          :options="dropzoneOptions"
                          @vdropzone-complete="uploadFileImage"
                          @vdropzone-removed-file="removeFileImage"
                          >
                        </vue-dropzone-component>                         
                      </div>
                    </div>                                                                      
                  </div>
                  <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions">
                      <div class="row">
                        <div class="col-3"></div>
                        <div class="col-9">
                          <button 
                            id="submit_form_update_data_user"
                            v-on:click="handleSubmitUpdateDataUser"
                            type="submit" 
                            class="btn btn-accent m-btn m-btn--air m-btn--custom"
                            :disabled="errors.any() || !isComplete"
                          >
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
import { mapActions, mapGetters } from "vuex";
// Types
import * as myProfileTypes from "../../types/myProfile";
import * as globalTypes from "../../types/global";
// NProgress System
var NProgress = require("../../libraries/nprogress.js");
// Component Show Notifications
import VueNotifications from "vue-notifications";
import DatePicker from "vue2-datepicker";
import vue2Dropzone from "vue2-dropzone";
import "vue2-dropzone/dist/vue2Dropzone.min.css";
// BEGIN:: component
export default {
  name: "EditDataUserComponent",
  components: {
    "datepicker-component": DatePicker,
    "vue-dropzone-component": vue2Dropzone
  },
  props: {
    userData: Object
  },
  data: function() {
    return {
      dropzoneOptions: {
        url: "https://httpbin.org/post",
        thumbnailWidth: 150,
        maxFilesize: 0.5,
        uploadMultiple: false ,
        addRemoveLinks: true,
        maxFiles: 1,
        dictDefaultMessage: this.dropZoneDefaultMessage(),
      }
    };
  },
  // Notifications System
  notifications: {
    showSuccessMsg: {
      type: VueNotifications.types.success,
      title: "",
      message: ""
    },
    showInfoMsg: {
      type: VueNotifications.types.info,
      title: "",
      message: ""
    },
    showWarnMsg: {
      type: VueNotifications.types.warn,
      title: "",
      message: ""
    },
    showErrorMsg: {
      type: VueNotifications.types.error,
      title: "",
      message: ""
    }
  },
  computed: {
    ...mapGetters({
      userEditData: myProfileTypes.USER,
      lang: globalTypes.LANGUAGE
    }),
    firstname: {
      get() {
        if (this.userEditData.firstname === null) {
          this.$store.commit(
            myProfileTypes.MUTATE_USER_FIRSTNAME,
            this.userData.firstname
          );
        }
        return this.userEditData.firstname;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_FIRSTNAME, value);
      }
    },
    lastname: {
      get() {
        if (this.userEditData.lastname === null) {
          this.$store.commit(
            myProfileTypes.MUTATE_USER_LASTNAME,
            this.userData.lastname
          );
        }
        return this.userEditData.lastname;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_LASTNAME, value);
      }
    },
    email: {
      get() {
        if (this.userEditData.email === null) {
          this.$store.commit(
            myProfileTypes.MUTATE_USER_EMAIL,
            this.userData.email
          );
        }
        return this.userEditData.email;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_EMAIL, value);
      }
    },
    birthdate: {
      get() {
        if (this.userEditData.birthdate === null) {
          this.$store.commit(
            myProfileTypes.MUTATE_USER_BIRTHDATE,
            //Moment( this.userData.birthdate.date ).format('DD/MM/YYYY')
            this.userData.birthdate
          );
        }
        return this.userEditData.birthdate;
      },
      set(value) {
        console.log(value);
        // this.$store.commit( myProfileTypes.MUTATE_USER_BIRTHDATE, Moment(value).format('DD/MM/YYYY') );
        this.$store.commit(
          myProfileTypes.MUTATE_USER_BIRTHDATE,
          new Date(value)
        );
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
        this.$store.commit(
          myProfileTypes.MUTATE_USER_PASSWORD_CONFIRMATION,
          value
        );
      }
    },
    isComplete() {
      return (
        this.firstname &&
        this.lastname &&
        this.email &&
        this.password &&
        this.passwordConfirmation
      );
    }
  },
  methods: {
    uploadFileImage(file) {
      this.$store.commit(
        myProfileTypes.MUTATE_USER_IMAGE_URL,
        file.dataURL
      );
      this.$store.commit(
        myProfileTypes.MUTATE_USER_IMAGE_NAME,
        file.name
      );
      // console.log(this.$refs.dropzoneImage.getQueuedFiles());
      // console.log(this.$refs.dropzoneImage.processQueue());
    },  
    removeFileImage(file) {
      this.$store.commit(
        myProfileTypes.MUTATE_USER_IMAGE_URL,
        ''
      );
      this.$store.commit(
        myProfileTypes.MUTATE_USER_IMAGE_NAME,
        ''
      );
      // console.log(this.$refs.dropzoneImage.getQueuedFiles());
      // console.log(this.$refs.dropzoneImage.processQueue());
    },       
    dropZoneDefaultMessage: function(){
      let message;
      let langSelected = this.$store.state.global.language;
      let translations = this.$store.state.global.translations[langSelected];
      if(translations !== undefined ){
        message = translations.dropZone.dict_default_message;
      }else {
        message = 'loading...';
      }
      return message;
    },
    handleSubmitUpdateDataUser: function() {
      // Start progress Bar
      NProgress.start();
      NProgress.set(0.4);
      let lang = this.$store.state.global.language;
      let notifications = this.$store.state.global.translations[lang]
        .notifications;
      this.showInfoMsg({ message: notifications.form_submitted, title: "" });
      // Todo
      this.$store
        .dispatch(myProfileTypes.SEND_FORM_DATA_USER)
        .then(result => {
          NProgress.done();
          this.showSuccessMsg({
            message: notifications.user_updated,
            title: ""
          });
        })
        .catch(error => {
          NProgress.done();
          this.showWarnMsg({
            message: notifications.error_with_api,
            title: ""
          });
        });
      // Finally progress Bar
    },
    validateBeforeSubmit() {
      this.$validator.validateAll().then(result => {
        if (!result) {
          console.log(result);
          //hay errores
        } else {
          this.$emit("sendFormDataUser");
        }
      });
    }
  }
};
</script>
<style scoped lang="scss">
.mx-input {
  height: calc(2.25rem + 2px);
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
}
</style>