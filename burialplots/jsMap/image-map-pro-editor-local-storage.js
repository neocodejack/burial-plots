!function(e,a,o,t){var r=!1;e.imp_editor_storage_get_saves_list=function(e){if(localStorage.editor_saves){for(var a=JSON.parse(localStorage.editor_saves),o=new Array,t=0;t<a.length;t++)o.push({id:a[t].id,name:a[t].general.name});e(o)}else e(new Array)},e.imp_editor_storage_get_save=function(e,a){if(localStorage.editor_saves)for(var o=JSON.parse(localStorage.editor_saves),t=0;t<o.length;t++)o[t].id==e&&a(o[t]);else a(!1)},e.imp_editor_storage_store_save=function(e,a){localStorage.editor_saves||(localStorage.editor_saves="[]");for(var o=JSON.parse(localStorage.editor_saves),t=!1,r=0;r<o.length;r++)o[r].id==e.id&&(t=!0,o[r]=e);t||o.push(e),localStorage.editor_saves=JSON.stringify(o),a(!0)},e.imp_editor_storage_delete_save=function(e,a){localStorage.editor_saves||(localStorage.editor_saves="[]");for(var o=JSON.parse(localStorage.editor_saves),t=0,r=0;r<o.length;r++)if(o[r].id==e){t=r;break}o.splice(t,1),localStorage.editor_saves=JSON.stringify(o),a()},e.imp_editor_storage_get_last_save=function(e){e(localStorage.editor_last_save?localStorage.editor_last_save:!1)},e.imp_editor_storage_set_last_save=function(e,a){localStorage.editor_last_save=e,a()},e(o).ready(function(){try{var e=a.localStorage,o="__storage_test__";e.setItem(o,o),e.removeItem(o),r=!0}catch(e){console.log("Local storage is NOT supported!"),r=!1}})}(jQuery,window,document);