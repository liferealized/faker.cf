<cfcomponent extends="base" output="false">

  <cffunction name="email" access="public" output="false" returntype="string">
    <cfreturn LCase(username()) & "@" & domainName() />
  </cffunction>

  <cffunction name="username" access="public" output="false" returntype="string">
    <cfscript>
      switch (randomNumber(5))
      {
        case 1:
          return arrayRandomize(_firstName());
          break;

        case 2:
          return arrayRandomize(_firstName()) & arrayRandomize([".", "_", "", "-"]) & arrayRandomize(_lastName());
          break;

        case 3:
          return arrayRandomize(_firstName()) & arrayRandomize([".", "_", "", "-"]) & replaceSymbolWithNumber("?????");
          break;

        case 4:
          return arrayRandomize(_firstName()) & arrayRandomize([".", "_", "", "-"]) & replaceSymbolWithNumber("????");
          break;

        case 5:
          return arrayRandomize(_firstName()) & arrayRandomize([".", "_", "", "-"]) & replaceSymbolWithNumber("???");
          break;
      }
    </cfscript>
  </cffunction>

  <cffunction name="domainName" access="public" output="false" returntype="string">
    <cfreturn domainWord() & "." & arrayRandomize(_domainSuffix()) />
  </cffunction>

  <cffunction name="domainWord" access="public" output="false" returntype="string">
    <cfscript>
      switch (randomNumber(5))
      {
        case 1:
          return LCase(arrayRandomize(_emailDomains()));
          break;

        default:
          return LCase(arrayRandomize(_firstName()));
          break;
      }
    </cfscript>
  </cffunction>

  <cffunction name="ipaddress" access="public" output="false" returntype="string">
    <cfscript>
      var loc = { result = [] };

      for (loc.i = 1; loc.i lte 4; loc.i++)
        result[loc.i] = randRange(0, 255, "SHA1PRNG");
    </cfscript>
    <cfreturn arrayToList(result, ".") />
  </cffunction>
  
</cfcomponent>
