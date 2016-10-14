/**
 * GeoIPServiceService.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
 /**
  * Usage example: to use this service from within your Flex application you have two choices:
  * Use it via Actionscript only
  * Use it via MXML tags
  * Actionscript sample code:
  * Step 1: create an instance of the service; pass it the LCDS destination string if any
  * var myService:GeoIPService= new GeoIPService();
  * Step 2: for the desired operation add a result handler (a function that you have already defined previously)  
  * myService.addGetGeoIPContextEventListener(myResultHandlingFunction);
  * Step 3: Call the operation as a method on the service. Pass the right values as arguments:
  * myService.GetGeoIPContext();
  *
  * MXML sample code:
  * First you need to map the package where the files were generated to a namespace, usually on the <mx:Application> tag, 
  * like this: xmlns:srv="net.webservicex.*"
  * Define the service and within its tags set the request wrapper for the desired operation
  * <srv:GeoIPService id="myService">
  *   <srv:GetGeoIPContext_request_var>
  *		<srv:GetGeoIPContext_request />
  *   </srv:GetGeoIPContext_request_var>
  * </srv:GeoIPService>
  * Then call the operation for which you have set the request wrapper value above, like this:
  * <mx:Button id="myButton" label="Call operation" click="myService.GetGeoIPContext_send()" />
  */
package net.webservicex
{
	import mx.rpc.AsyncToken;
	import flash.events.EventDispatcher;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.events.FaultEvent;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;

    /**
     * Dispatches when a call to the operation GetGeoIPContext completes with success
     * and returns some data
     * @eventType GetGeoIPContextResultEvent
     */
    [Event(name="GetGeoIPContext_result", type="net.webservicex.GetGeoIPContextResultEvent")]
    
    /**
     * Dispatches when a call to the operation GetGeoIP completes with success
     * and returns some data
     * @eventType GetGeoIPResultEvent
     */
    [Event(name="GetGeoIP_result", type="net.webservicex.GetGeoIPResultEvent")]
    
	/**
	 * Dispatches when the operation that has been called fails. The fault event is common for all operations
	 * of the WSDL
	 * @eventType mx.rpc.events.FaultEvent
	 */
    [Event(name="fault", type="mx.rpc.events.FaultEvent")]

	public class GeoIPService extends EventDispatcher implements IGeoIPService
	{
    	private var _baseService:BaseGeoIPService;
        
        /**
         * Constructor for the facade; sets the destination and create a baseService instance
         * @param The LCDS destination (if any) associated with the imported WSDL
         */  
        public function GeoIPService(destination:String=null,rootURL:String=null)
        {
        	_baseService = new BaseGeoIPService(destination,rootURL);
        }
        
		//stub functions for the GetGeoIPContext operation
          

        /**
         * @see IGeoIPService#GetGeoIPContext()
         */
        public function getGeoIPContext():AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.getGeoIPContext();
            _internal_token.addEventListener("result",_GetGeoIPContext_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IGeoIPService#GetGeoIPContext_send()
		 */    
        public function getGeoIPContext_send():AsyncToken
        {
        	return getGeoIPContext();
        }
              
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _getGeoIPContext_lastResult:GeoIP;
		[Bindable]
		/**
		 * @see IGeoIPService#GetGeoIPContext_lastResult
		 */	  
		public function get getGeoIPContext_lastResult():GeoIP
		{
			return _getGeoIPContext_lastResult;
		}
		/**
		 * @private
		 */
		public function set getGeoIPContext_lastResult(lastResult:GeoIP):void
		{
			_getGeoIPContext_lastResult = lastResult;
		}
		
		/**
		 * @see IGeoIPService#addGetGeoIPContext()
		 */
		public function addgetGeoIPContextEventListener(listener:Function):void
		{
			addEventListener(GetGeoIPContextResultEvent.GetGeoIPContext_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _GetGeoIPContext_populate_results(event:ResultEvent):void
		{
			var e:GetGeoIPContextResultEvent = new GetGeoIPContextResultEvent();
		            e.result = event.result as GeoIP;
		                       e.headers = event.headers;
		             getGeoIPContext_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the GetGeoIP operation
          

        /**
         * @see IGeoIPService#GetGeoIP()
         */
        public function getGeoIP(iPAddress:String):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.getGeoIP(iPAddress);
            _internal_token.addEventListener("result",_GetGeoIP_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IGeoIPService#GetGeoIP_send()
		 */    
        public function getGeoIP_send():AsyncToken
        {
        	return getGeoIP(_GetGeoIP_request.IPAddress);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _GetGeoIP_request:GetGeoIP_request;
		/**
		 * @see IGeoIPService#GetGeoIP_request_var
		 */
		[Bindable]
		public function get getGeoIP_request_var():GetGeoIP_request
		{
			return _GetGeoIP_request;
		}
		
		/**
		 * @private
		 */
		public function set getGeoIP_request_var(request:GetGeoIP_request):void
		{
			_GetGeoIP_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _getGeoIP_lastResult:GeoIP;
		[Bindable]
		/**
		 * @see IGeoIPService#GetGeoIP_lastResult
		 */	  
		public function get getGeoIP_lastResult():GeoIP
		{
			return _getGeoIP_lastResult;
		}
		/**
		 * @private
		 */
		public function set getGeoIP_lastResult(lastResult:GeoIP):void
		{
			_getGeoIP_lastResult = lastResult;
		}
		
		/**
		 * @see IGeoIPService#addGetGeoIP()
		 */
		public function addgetGeoIPEventListener(listener:Function):void
		{
			addEventListener(GetGeoIPResultEvent.GetGeoIP_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _GetGeoIP_populate_results(event:ResultEvent):void
		{
			var e:GetGeoIPResultEvent = new GetGeoIPResultEvent();
		            e.result = event.result as GeoIP;
		                       e.headers = event.headers;
		             getGeoIP_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//service-wide functions
		/**
		 * @see IGeoIPService#getWebService()
		 */
		public function getWebService():BaseGeoIPService
		{
			return _baseService;
		}
		
		/**
		 * Set the event listener for the fault event which can be triggered by each of the operations defined by the facade
		 */
		public function addGeoIPServiceFaultEventListener(listener:Function):void
		{
			addEventListener("fault",listener);
		}
		
		/**
		 * Internal function to re-dispatch the fault event passed on by the base service implementation
		 * @private
		 */
		 
		 private function throwFault(event:FaultEvent):void
		 {
		 	dispatchEvent(event);
		 }
    }
}
