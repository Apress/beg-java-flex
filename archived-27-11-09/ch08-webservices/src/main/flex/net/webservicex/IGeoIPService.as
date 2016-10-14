
/**
 * Service.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package net.webservicex{
	import mx.rpc.AsyncToken;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;
               
    public interface IGeoIPService
    {
    	//Stub functions for the GetGeoIPContext operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @return An AsyncToken
    	 */
    	function getGeoIPContext():AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function getGeoIPContext_send():AsyncToken;
        
        /**
         * The getGeoIPContext operation lastResult property
         */
        function get getGeoIPContext_lastResult():GeoIP;
		/**
		 * @private
		 */
        function set getGeoIPContext_lastResult(lastResult:GeoIP):void;
       /**
        * Add a listener for the getGeoIPContext operation successful result event
        * @param The listener function
        */
       function addgetGeoIPContextEventListener(listener:Function):void;
       
       
    	//Stub functions for the GetGeoIP operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param IPAddress
    	 * @return An AsyncToken
    	 */
    	function getGeoIP(iPAddress:String):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function getGeoIP_send():AsyncToken;
        
        /**
         * The getGeoIP operation lastResult property
         */
        function get getGeoIP_lastResult():GeoIP;
		/**
		 * @private
		 */
        function set getGeoIP_lastResult(lastResult:GeoIP):void;
       /**
        * Add a listener for the getGeoIP operation successful result event
        * @param The listener function
        */
       function addgetGeoIPEventListener(listener:Function):void;
       
       
        /**
         * The getGeoIP operation request wrapper
         */
        function get getGeoIP_request_var():GetGeoIP_request;
        
        /**
         * @private
         */
        function set getGeoIP_request_var(request:GetGeoIP_request):void;
                   
        /**
         * Get access to the underlying web service that the stub uses to communicate with the server
         * @return The base service that the facade implements
         */
        function getWebService():BaseGeoIPService;
	}
}