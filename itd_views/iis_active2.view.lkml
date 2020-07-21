view: iis_active2 {
  derived_table: {
    sql: select
      parsing_time,
      event_time,
      dst_ip,
      http_method,
      http_path,
      qry,
      dst_port,
      case when src_user_name is null then 'Anonymous User' else src_user_name end as src_user_name,
      src_ip,
      http_useragent,
      case when position('/', http_useragent) = 0 then http_useragent else
      substring (http_useragent,0,position('/', http_useragent)-1) end as Device,
      case when position('/', http_useragent) = 0 then http_useragent else
      substring (http_useragent,position('/', http_useragent)+1,
      length(http_useragent)) end as Device_Version,
      http_status,
      http_substatus,
      win32_status,
      http_time,
      raw,
      risk_desc,
      http_domain,
      rpt_host,
      http_version,
      http_cookie,
      http_referrer,
      dst_host,
      out_bytes,
      in_bytes,
      src_geo_id,
      src_geo_code,
      replace(src_geo_country,'"') as src_geo_country,
      replace(src_geo_city,'"') as src_geo_city,
      src_geo_lat,
      src_geo_long,
      dst_geo_id,
      dst_geo_code,
      replace(dst_geo_country,'"') as dst_geo_country,
     replace(dst_geo_city,'"') as dst_geo_city,
      dst_geo_lat,
      dst_geo_long,
      case when dst_port = 443 then 'Encrypted' else 'Not Encrypted' end as Encryption_Details,
      Case when http_status = ('100') then 'Information'
      when http_status = ('101') then 'Switching Protocols'
      when http_status = ('200') then 'Success'
           when http_status = ('201') then 'Created'
      when http_status = ('202') then 'Accepted'
      when http_status = ('203') then 'Nonauthoritative Information'
      when http_status = ('204') then 'Nocontent'
      when http_status = ('205') then 'Reset content'
      when http_status = ('206') then 'Partial Content'
      when http_status = ('301') then 'Moved permanently'
      when http_status = ('302') then 'Object moved'
      when http_status = ('304') then 'Not modified'
      when http_status = ('307') then 'Temporary redirect'
      when http_status = ('400') then 'Bad Request'
      when http_status = ('401') then 'Access Denied'
      when http_status = ('403') then 'Forbidden'
      when http_status = ('404') then 'Not Found'
      when http_status = ('405') then 'Method Not Allowed'
      when http_status = ('406') then 'Client browser does not accept the MIME type of the requested page'
      when http_status = ('408') then 'Request timed out'
      when http_status = ('412') then 'Precondition failed'
           When http_status = ('500') then 'Internal server error'
           When http_status = ('501') then 'Header values specify a configuration that is not implemented'
           When http_status = ('502') then 'Web server received an invalid response while acting as a gateway or proxy'
          When http_status = ('503') then 'Service unavailable'
          when http_status = ('507') then 'Insufficient Storage'

      else 'Others' end as HTTP_Status_Detail,
      Case when http_status = ('100') then 'Information'
      when http_status = ('101') then 'Switching Protocols'
      when http_status = ('200') then 'Success'
           when http_status = ('201') then 'Created'
      when http_status = ('202') then 'Accepted'
      when http_status = ('203') then 'Nonauthoritative Information'
      when http_status = ('204') then 'Nocontent'
      when http_status = ('205') then 'Reset content'
      when http_status = ('206') then 'Partial Content'
      when http_status = ('301') then 'Moved permanently'
      when http_status = ('302') then 'Object moved'
      when http_status = ('304') then 'Not modified'
      when http_status = ('307') then 'Temporary redirect'
      when http_status like ('400') then
      Case when http_substatus = ('1') then 'Invalid Destination Header'
      when http_substatus = ('2') then 'Invalid Depth Header'
      when http_substatus = ('3') then 'Invalid IF Header'
      when http_substatus = ('4') then 'Invalid Overwrite Header'
      when http_substatus = ('5') then 'Invalid Translate Header'
      when http_substatus = ('6') then 'Invalid Request Body'
      when http_substatus = ('7') then 'Invalid Content Length'
      when http_substatus = ('8') then 'Invalid Timeout'
      when http_substatus = ('9') then 'Invalid Lock Token'
      End
      when http_status like ('401') then
          Case when http_substatus = ('1') then 'Logon Failed'
      when http_substatus = ('2') then 'Logon Failed due to Server configuration'
      when http_substatus = ('3') then 'Unauthorized due to ACL on resource'
      when http_substatus = ('4') then 'Auhtorization failed by filter'
      when http_substatus = ('5') then 'Authorization failed by ISAPI/CGI application'
      when http_substatus = ('501') then 'Access Denied:Too many requests from same client IP'
      when http_substatus = ('502') then 'Forbidden: Too many req from same client IP'
      when http_substatus = ('503') then 'Access Denied: IP address is in Deny list of IP Restriction'
      when http_substatus = ('504') then 'Access Denied: Hostname is in Deny list of IP Restriction'
      End
      when http_status like ('403') then
      Case when http_substatus = ('1') then 'Execute access forbidden'
      when http_substatus = ('2') then 'Read access forbidden'
      when http_substatus = ('3') then 'Write access forbidden'
      when http_substatus = ('4') then 'SSL required'
      when http_substatus = ('5') then 'SSL 128 required'
      when http_substatus = ('6') then 'IP ddress rejected'
      when http_substatus = ('7') then 'Client certificate required'
      when http_substatus = ('8') then 'Site access denied'
      when http_substatus = ('9') then 'Forbidden: Too many clients are trying to connect to the web server'
      when http_substatus = ('10') then 'Forbidden: web server is configures to deny Execute access '
      when http_substatus = ('11') then 'Forbidden: Password has been changed'
      when http_substatus = ('12') then 'Mapper denied access'
      when http_substatus = ('13') then 'Client certificate revoked'
      when http_substatus = ('14') then 'Directory listing denied'
      when http_substatus = ('15') then 'Client access licenses have exceeded limits on the web server'
      when http_substatus = ('16') then 'Client certificate is untrusted or invalid'
      when http_substatus = ('17') then 'Client certificate has expired or is not yet valid'
      when http_substatus = ('18') then 'Cannot execute requested URL in the current application pool'
      when http_substatus = ('19') then 'Cannot execute CGI applications for the client in this application pool.'
      when http_substatus = ('20') then 'Forbidden: Passport logon failed'
      when http_substatus = ('21') then 'Source access denied'
      when http_substatus = ('22') then 'Infinite depth is denied'
      when http_substatus = ('501') then 'Too many requests from same client IP'
      when http_substatus = ('502') then 'Too many req from same client IP'
      when http_substatus = ('503') then 'IP address is in Deny list of IP Restriction'
      when http_substatus = ('504') then 'Hostname is in Deny list of IP Restriction'
      End
      when http_status = ('404') then
      Case when http_substatus = ('0') then 'Not found'
      when http_substatus = ('1') then 'Site Not Found'
      when http_substatus = ('2') then 'ISAPI or CGI restriction'
      when http_substatus = ('3') then 'MIME type restriction'
      when http_substatus = ('4') then 'No handler configured'
      when http_substatus = ('5') then 'Denied by request filtering configuration'
      when http_substatus = ('6') then 'Verb denied'
      when http_substatus = ('7') then 'File extension denied'
      when http_substatus = ('8') then 'Hidden namespace'
      when http_substatus = ('9') then 'File attribute hidden'
      when http_substatus = ('10') then 'Request header too long'
      when http_substatus = ('11') then 'Request contains double escape sequence'
      when http_substatus = ('12') then 'Request contains high-bit characters'
      when http_substatus = ('13') then 'Content length too large'
      when http_substatus = ('14') then 'Request URL too long'
      when http_substatus = ('15') then 'Query string too long'
      when http_substatus = ('16') then 'DAV request sent to the static file handler'
      when http_substatus = ('17') then 'Dynamic content mapped to the static file handler via a wildcard MIME mapping'
      when http_substatus = ('18') then 'Querystring sequence denied'
      when http_substatus = ('19') then 'Denied by filtering rule'
      when http_substatus = ('20') then 'Too Many URL Segments'
      when http_substatus = ('501') then 'Too many requests from the same client IP'
      when http_substatus = ('502') then 'Too many requests from the same client IP'
      when http_substatus = ('503') then 'IP address is included in the Deny list of IP Restriction'
      when http_substatus = ('504') then 'the host name is included in the Deny list of IP Restriction'

      End
      when http_status = ('406') then 'Client browser does not accept the MIME type of the requested page'
      when http_status = ('408') then 'Request timed out'
      when http_status = ('412') then 'Precondition failed'

      when http_status = ('500') then
      Case when http_substatus = ('0') then 'Module or ISAPI error occurred'
      when http_substatus = ('11') then 'Application is shutting down on the web server'
      when http_substatus = ('12') then 'Application is busy restarting on the web server'
      when http_substatus = ('13') then 'Web server is too busy'
      when http_substatus = ('15') then 'Direct requests for Global.asax are not allowed'
      when http_substatus = ('19') then 'Configuration data is invalid'
      when http_substatus = ('21') then 'Module not recognized'
      when http_substatus = ('22') then 'An ASP.NET httpModules configuration does not apply in Managed Pipeline mode'
      when http_substatus = ('23') then 'An ASP.NET httpHandlers configuration does not apply in Managed Pipeline mode'

      when http_substatus = ('24') then 'An ASP.NET impersonation configuration does not apply in Managed Pipeline mode'

      when http_substatus = ('50') then 'Rewrite error occurred during RQ_BEGIN_REQUEST notification handling'

      when http_substatus = ('51') then 'Rewrite error occurred during GL_PRE_BEGIN_REQUEST notification handling'

      when http_substatus = ('52') then 'A rewrite error occurred during RQ_SEND_RESPONSE notification handling'

      when http_substatus = ('53') then 'A rewrite error occurred during RQ_RELEASE_REQUEST_STATE notification handling'

      when http_substatus = ('100') then 'Internal ASP error'
      End
      when http_status = ('501') then 'Header values specify a configuration that is not implemented'
      when http_status = ('502') then
      Case when http_substatus = ('1') then 'CGI application timeout'
      when http_substatus = ('2') then 'Bad gateway: Premature Exit'
      when http_substatus = ('3') then 'Bad Gateway: Forwarder Connection Error (ARR)'
      when http_substatus = ('4') then 'Bad Gateway: No Server (ARR)'
      End
      when http_status = ('503') then
      Case when http_substatus = ('0') then 'Application pool unavailable'
          when http_substatus = ('2') then 'Concurrent request limit exceeded'
      when http_substatus = ('3') then 'ASP.NET queue full'
      when http_substatus = ('4') then 'FastCGI queue full'
      End
      when http_status = ('507') then 'Insufficient Storage'

      else 'Others' end as HTTP_Substatus_Detail
      from iis_odm sst where src_ip!='' and {% condition datefilter %} event_time {% endcondition %} and  {% condition User %} src_user_name {% endcondition %}
       ;;
  }
  filter: datefilter {
    type: date
  }
  filter: User {
    type: string
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: parsing_time {
    type: number
    sql: ${TABLE}."PARSING_TIME" ;;
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}."EVENT_TIME" ;;
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: http_method {
    type: string
    sql: ${TABLE}."HTTP_METHOD" ;;
  }

  dimension: http_path {
    type: string
    sql: ${TABLE}."HTTP_PATH" ;;
  }

  dimension: qry {
    type: string
    sql: ${TABLE}."QRY" ;;
  }

  dimension: dst_port {
    type: string
    sql: ${TABLE}."DST_PORT" ;;
  }

  dimension: src_user_name {
    type: string
    sql: ${TABLE}."SRC_USER_NAME" ;;
    link:
    {
      label: "filter_user"
      url: "/dashboards/37?User={{ value }}"
    }
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
  }

  dimension: http_useragent {
    type: string
    sql: ${TABLE}."HTTP_USERAGENT" ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}."DEVICE" ;;
  }

  dimension: device_version {
    type: string
    sql: ${TABLE}."DEVICE_VERSION" ;;
  }

  dimension: http_status {
    type: string
    sql: ${TABLE}."HTTP_STATUS" ;;
  }

  dimension: http_substatus {
    type: string
    sql: ${TABLE}."HTTP_SUBSTATUS" ;;
  }

  dimension: win32_status {
    type: string
    sql: ${TABLE}."WIN32_STATUS" ;;
  }

  dimension: http_time {
    type: string
    sql: ${TABLE}."HTTP_TIME" ;;
  }

  dimension: raw {
    type: string
    sql: ${TABLE}."RAW" ;;
  }

  dimension: risk_desc {
    type: string
    sql: ${TABLE}."RISK_DESC" ;;
  }

  dimension: http_domain {
    type: string
    sql: ${TABLE}."HTTP_DOMAIN" ;;
  }

  dimension: rpt_host {
    type: string
    sql: ${TABLE}."RPT_HOST" ;;
  }

  dimension: http_version {
    type: string
    sql: ${TABLE}."HTTP_VERSION" ;;
  }

  dimension: http_cookie {
    type: string
    sql: ${TABLE}."HTTP_COOKIE" ;;
  }

  dimension: http_referrer {
    type: string
    sql: ${TABLE}."HTTP_REFERRER" ;;
  }

  dimension: dst_host {
    type: string
    sql: ${TABLE}."DST_HOST" ;;
  }

  dimension: out_bytes {
    type: string
    sql: ${TABLE}."OUT_BYTES" ;;
  }

  dimension: in_bytes {
    type: string
    sql: ${TABLE}."IN_BYTES" ;;
  }

  dimension: src_geo_id {
    type: string
    sql: ${TABLE}."SRC_GEO_ID" ;;
  }

  dimension: src_geo_code {
    type: string
    sql: ${TABLE}."SRC_GEO_CODE" ;;
  }

  dimension: src_geo_country {
    type: string
    sql: ${TABLE}."SRC_GEO_COUNTRY" ;;
  }

  dimension: src_geo_city {
    type: string
    sql: ${TABLE}."SRC_GEO_CITY" ;;
  }

  dimension: src_geo_lat {
    type: string
    sql: ${TABLE}."SRC_GEO_LAT" ;;
  }

  dimension: src_geo_long {
    type: string
    sql: ${TABLE}."SRC_GEO_LONG" ;;
  }

  dimension: dst_geo_id {
    type: string
    sql: ${TABLE}."DST_GEO_ID" ;;
  }

  dimension: dst_geo_code {
    type: string
    sql: ${TABLE}."DST_GEO_CODE" ;;
  }

  dimension: dst_geo_country {
    type: string
    sql: ${TABLE}."DST_GEO_COUNTRY" ;;
  }

  dimension: dst_geo_city {
    type: string
    sql: ${TABLE}."DST_GEO_CITY" ;;
  }

  dimension: dst_geo_lat {
    type: string
    sql: ${TABLE}."DST_GEO_LAT" ;;
  }

  dimension: dst_geo_long {
    type: string
    sql: ${TABLE}."DST_GEO_LONG" ;;
  }

  dimension: encryption_details {
    type: string
    sql: ${TABLE}."ENCRYPTION_DETAILS" ;;
  }

  dimension: http_status_detail {
    type: string
    sql: ${TABLE}."HTTP_STATUS_DETAIL" ;;
  }

  dimension: http_substatus_detail {
    type: string
    sql: ${TABLE}."HTTP_SUBSTATUS_DETAIL" ;;
  }

  dimension: src_location {
    type: location
    sql_latitude: ${src_geo_lat} ;;
    sql_longitude: ${src_geo_long} ;;
  }

  dimension: dst_location {
    type: location
    sql_latitude: ${dst_geo_lat} ;;
    sql_longitude: ${dst_geo_long} ;;
  }

  set: detail {
    fields: [
      parsing_time,
      event_time_time,
      dst_ip,
      http_method,
      http_path,
      qry,
      dst_port,
      src_user_name,
      src_ip,
      http_useragent,
      device,
      device_version,
      http_status,
      http_substatus,
      win32_status,
      http_time,
      raw,
      risk_desc,
      http_domain,
      rpt_host,
      http_version,
      http_cookie,
      http_referrer,
      dst_host,
      out_bytes,
      in_bytes,
      src_geo_id,
      src_geo_code,
      src_geo_country,
      src_geo_city,
      src_geo_lat,
      src_geo_long,
      dst_geo_id,
      dst_geo_code,
      dst_geo_country,
      dst_geo_city,
      dst_geo_lat,
      dst_geo_long,
      encryption_details,
      http_status_detail,
      http_substatus_detail
    ]
  }
}
