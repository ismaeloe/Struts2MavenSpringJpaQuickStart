<%@ page language="java" contentType="text/html;charset=windows-1252" pageEncoding="windows-1252"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- @ taglib prefix="sj" uri="/struts-jquery-tags" --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="iso-8859-1">
	<meta http-equiv="Content-Type" content="text/html;iso-8859-1"/>
	<meta http-equiv='cache-control' content='no-cache'>
	<meta http-equiv='expires' content='0'>
	<meta http-equiv='pragma' content='no-cache'>	
	<title>Login</title>

	<s:head/>

	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/form.css"/>

	<script type="text/javascript">
	function showText()
	{
		var txtTipoPase = document.getElementById("tipoPase");
		
		if (txtTipoPase.value == "3")
		{
			var lblAcceso = document.getElementById("lblAcceso");
			lblAcceso.innerHTML = "ACCESO FORANEO";
		}
	}
	</script>
</head>

<body onload="showText();">
<div id="main">
	<div id="imHeaderBg"><img src="imgs/logolapi.png" width="100%" alt="Lapi Salud Integral"/></div>
	<%--
   <div id="top-bar">
		<a href="http://www.lapi.com.mx"><span style="cursor:pointer;"> 
			<img src="imgs/hex40.jpg" alt="Lapi Salud Integral" height="102" width="166"/>
		</span></a>
		<img src="imgs/hex41.jpg" height="77" width="1022" style="float:right;" />
	</div>
	--%>
	<div id="header" style="height:30px; text-align:center;">
		<%--img src="imgs/hex43.jpg" height="5" width="1219" style="padding:10px 0px 0px 0px;"/ --%>
		<label style="font-weight:lighter; color:Teal; font-size:xx-large;">PASE M&Eacute;DICO EMPRESARIAL</label>
	</div>

	<div id="content" style="width:1100px; margin-top:10px; margin-left:80px;">

		<div id="content-table" style="height:340px; clear:both; padding:10px; margin:10px 50px 0px 0px;" >

			<div id="content-left" class="fl" style="width:240px;">
				<img src="imgs/hex52.jpg" height="319px" width="236px"/>
			</div>

			<div id="form-full" class="fl" style="width:460px;">

				<div id="form-header" class="fl" style="width:460px; height:40px; text-align:center; background-color:rgb(246,127,0);" >
					<p id="lblAcceso" style="margin-top:6px; font-weight:lighter; color:White; font-size:x-large; ">ACCESO  CDMX</p>
				</div>

				<div id="form" class="fl" style="width:460px; height:270px; margin-top:4px; background-color:rgb(248,248,248);" >
               <s:if test="hasActionErrors()">
   					<div id="divError" class="errors">
      				<s:actionerror/>
   					</div>
					</s:if>
					<s:form action="welcome" name="welcome" id="welcome" validate="true"  >
						<tr height="34px">
							<td width="34%">&nbsp;</td>
							<td width="66%">&nbsp;</td>
						</tr>
						<s:textfield name="userName" label="Usuario"  value=""
						   size="37" maxlength="60" cssStyle="height:2em;" placeholder="Su cuenta de correo" /> 
						<tr height="24px"><td colspan="2">&nbsp;</td></tr>
						<s:password	 name="pwd"      label="Contraseña"  value=""
						   size="37" maxlength="10" cssStyle="height:2em;"  placeholder="Su Contraseña" />

							<s:hidden id="tipoPase"  name="tipoPase" key="tipoPase" />

							<tr height="30px"><td colspan="2">&nbsp;</td></tr>
						<tr height="30px">
							<td> </td>
							<td> 
								<input type="submit" value="ENTRAR"  class="submitreset"/>           
								<input type="reset"  value="LIMPIAR" class="submitreset" style="height:28px;"/>
							</td>
						</tr>
						<tr><td colspan="2"> </td></tr>
						<s:token/>
					</s:form>
				</div>
			</div>
         
			<div id="newpwd"
              style="float:left; width:300px; height:190px; text-align:center; background-color:rgb(249,249,249); margin-top:40px;">
         
				<table style="width:100%; height:100%; border: 4px double">
					<tr valign="middle">
						<td  align="center">
                     <input type="button" class="boton"
                     	onclick="window.open('/pasemedicoweb/recupera', '_blank', 'top=50, left=200, width=740, height=600, menubar=0 ,toolbar=0 ,titlebar=0 ,status=0' ,replace=false)"
                     	value="OLVIDE  MI CONTRASEÑA" />
                     <br/>
                     <br/><img src="imgs/hex66.jpg" alt="Ayuda" height="28" width="26"/>
                     <br/>
                     <br/>
                     <input type="button" class="boton"
                     	onclick="window.open('/pasemedicoweb/cambiapwd', '_self', 'top=50, left=200, width=740, height=650, menubar=0 ,toolbar=0 ,titlebar=0 ,status=0' ,replace=false)" 
                     	value="CAMBIAR MI CONTRASEÑA" />
						</td>
          		</tr>
            </table>
         </div>
      </div>
   </div>
   
   <div id="footer" style="width:100%; height:60px; text-align:center;clear:both;float:left;">
            <hr style="border-width:thick;"/>
      <a href="http://www.lapi.com.mx" target="_blank"><span style="font-weight:lighter; color:Teal; font-size:large; border-width:thin; cursor:pointer;">
       Regresar a Lapi.com.mx</span>
      </a>
   </div>

   <div id="bottom"
        style="width:100%; height:60px; border-style:solid; text-align:center; clear:both; float:left; background-color:rgb(0,49,148);">
   </div>

</div>

<script type="text/javascript">
	function validateForm_welcome() {
       var getFieldValue = function(field)
       {
			var type = field.type ? field.type : field[0].type;
			if (type == 'select-one' || type == 'select-multiple') {
				return (field.selectedIndex == -1 ? "" : field.options[field.selectedIndex].value);
			} else if (type == 'checkbox' || type == 'radio') {
                if (!field.length) {
                    field = [field];
                }
                for (var i = 0; i < field.length; i++) {
                    if (field[i].checked) {
                        return field[i].value;
                    }
                }
                return "";
         }
			return field.value;
		}
        form = document.getElementById("welcome");
        clearErrorMessages(form);
        clearErrorLabels(form);

        var errors = false;
        var continueValidation = true;
        
        	// validator required, requiredstring
        	if (form.elements['userName']) {
            field = form.elements['userName'];

            var error = "Favor de introducir su cuenta de correo electronico";
            var fieldValue = getFieldValue(field);
            
            if (fieldValue == "") {
                addError(field, error);
                errors = true;
                continueValidation = false;
            }
            
            if (continueValidation && fieldValue != null && (fieldValue == "" || fieldValue.replace(/^\s+|\s+$/g,"").length == 0)) {
                addError(field, error);
                errors = true;
                continueValidation = false;
            }

        		//validator email
            if (continueValidation && fieldValue != null && fieldValue.length > 0 && fieldValue.match("\\b^[\'_a-z0-9-\\+]+(\\.[\'_a-z0-9-\\+]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*\\.([a-z]{2}|aero|arpa|asia|biz|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|nato|net|org|pro|tel|travel|xxx)$\\b")==null) {
            	var error = "Debe introducir un correo valido.";
               addError(field, error);
               errors = true;
				}
			}
        
        //required
        //requiredstring
        if (form.elements['pwd']) {
            field = form.elements['pwd'];

     			var error = "Debe introducir su Contraseña";
            var fieldValue = getFieldValue(field);
            
            if (fieldValue == "") {
                addError(field, error);
                errors = true;
                continueValidation = false;
            }
            
            if (continueValidation && fieldValue != null && (fieldValue == "" || fieldValue.replace(/^\s+|\s+$/g,"").length == 0)) {            
                addError(field, error);
                errors = true;
                continueValidation = false;
            }

				//stringlength
				if (continueValidation && fieldValue != null) {
					var error = "La contraseña debe ser de 6 a 10 digitos";
            	var value = fieldValue;
            	//trim
					while (value.substring(0,1) == ' ')
							 value = value.substring(1, value.length);
            	while (value.substring(value.length-1, value.length) == ' ')
							 value = value.substring(0, value.length-1);
            	if ((6 > -1 && value.length < 6) ||
           			 (10 > -1 && value.length > 10)) {
						addError(field, error);
						errors = true;
					}
				}
        }
      return !errors;
    }
</script>
</body>
</html>