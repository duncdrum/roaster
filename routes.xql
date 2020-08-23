xquery version "3.1";

import module namespace router="http://exist-db.org/xquery/router" at "./content/router.xql";

declare namespace route="http://exist-db.org/apps/router/route";
declare namespace output="http://www.w3.org/2010/xslt-xquery-serialization";

declare function route:echo-parameters($parameters as map(*)) {
    $parameters
};

let $lookup := function($name as xs:string) {
    function-lookup(xs:QName($name), 1)
}
let $resp := router:route("routes.json", $lookup)
return
    $resp