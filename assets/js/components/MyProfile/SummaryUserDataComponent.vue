<template>
  <div class="m-portlet m-portlet--full-height  ">
    <div class="m-portlet__body">
      <div class="m-card-profile">
        <div class="m-card-profile__title m--hide">
          Your Profile
        </div>
        <div class="m-card-profile__pic">
          <div class="m-card-profile__pic-wrapper">
            <img :src="urlImageUser" alt="" style="width:80px;height:80px;">
          </div>
        </div>
        <div class="m-card-profile__details">
          <span class="m-card-profile__name">
          {{userData.firstname}} {{userData.lastname}}
          </span>
          <a href="" class="m-card-profile__email m-link">
          {{userData.email}}
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "SummaryUserDataComponent",
  props: {
    userData: Object,
    urlImageUser: String
  }
};
</script>
<style scoped lang="scss">
</style>