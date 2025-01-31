@EndUserText.label: 'Interface ZJTB_STUD_ATTA'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZJI_ATTACHMENT
  as select from zjtb_stud_atta as Attachment
  association to parent ZJI_STUDENT_2 as _Student on $projection.Student_Id = _Student.StudentId
{
      @EndUserText.label: 'Attachment ID'
  key atta_id         as AttaId,
      @EndUserText.label: 'Student ID'
      student_id      as Student_Id,
      @EndUserText.label: 'Comments'
      comments        as Comments,
      @EndUserText.label: 'Attachment'
      @Semantics.largeObject:{
        mimeType: 'Mimetype',
        fileName: 'Filename',
        contentDispositionPreference: #ATTACHMENT,
        acceptableMimeTypes: ['application/pdf']
      }
      attachment      as Attachment,
      @EndUserText.label: 'Mime'
      mimetype        as Mimetype,
      @EndUserText.label: 'Filename'
      filename        as Filename,
      @Semantics.systemDateTime.lastChangedAt: true
      @EndUserText.label: 'Last Changed At'
      last_changed_at as LastChangedAt,
      /* Association */
      _Student
}
