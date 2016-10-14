/**
 * BaseGeoIPServiceService.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package net.webservicex
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import mx.controls.treeClasses.DefaultDataDescriptor;
	import mx.utils.ObjectUtil;
	import mx.utils.ObjectProxy;
	import mx.messaging.events.MessageFaultEvent;
	import mx.messaging.MessageResponder;
	import mx.messaging.messages.SOAPMessage;
	import mx.messaging.messages.ErrorMessage;
   	import mx.messaging.ChannelSet;
	import mx.messaging.channels.DirectHTTPChannel;
	import mx.rpc.*;
	import mx.rpc.events.*;
	import mx.rpc.soap.*;
	import mx.rpc.wsdl.*;
	import mx.rpc.xml.*;
	import mx.rpc.soap.types.*;
	import mx.collections.ArrayCollection;
	
	/**
	 * Base service implementation, extends the AbstractWebService and adds specific functionality for the selected WSDL
	 * It defines the options and properties for each of the WSDL's operations
	 */ 
	public class BaseGeoIPService extends AbstractWebService
    {
		private var results:Object;
		private var schemaMgr:SchemaManager;
		private var BaseGeoIPServiceService:WSDLService;
		private var BaseGeoIPServicePortType:WSDLPortType;
		private var BaseGeoIPServiceBinding:WSDLBinding;
		private var BaseGeoIPServicePort:WSDLPort;
		private var currentOperation:WSDLOperation;
		private var internal_schema:BaseGeoIPServiceSchema;
	
		/**
		 * Constructor for the base service, initializes all of the WSDL's properties
		 * @param [Optional] The LCDS destination (if available) to use to contact the server
		 * @param [Optional] The URL to the WSDL end-point
		 */
		public function BaseGeoIPService(destination:String=null, rootURL:String=null)
		{
			super(destination, rootURL);
			if(destination == null)
			{
				//no destination available; must set it to go directly to the target
				this.useProxy = false;
			}
			else
			{
				//specific destination requested; must set proxying to true
				this.useProxy = true;
			}
			
			if(rootURL != null)
			{
				this.endpointURI = rootURL;
			} 
			else 
			{
				this.endpointURI = null;
			}
			internal_schema = new BaseGeoIPServiceSchema();
			schemaMgr = new SchemaManager();
			for(var i:int;i<internal_schema.schemas.length;i++)
			{
				internal_schema.schemas[i].targetNamespace=internal_schema.targetNamespaces[i];
				schemaMgr.addSchema(internal_schema.schemas[i]);
			}
BaseGeoIPServiceService = new WSDLService("BaseGeoIPServiceService");
			BaseGeoIPServicePort = new WSDLPort("BaseGeoIPServicePort",BaseGeoIPServiceService);
        	BaseGeoIPServiceBinding = new WSDLBinding("BaseGeoIPServiceBinding");
	        BaseGeoIPServicePortType = new WSDLPortType("BaseGeoIPServicePortType");
       		BaseGeoIPServiceBinding.portType = BaseGeoIPServicePortType;
       		BaseGeoIPServicePort.binding = BaseGeoIPServiceBinding;
       		BaseGeoIPServiceService.addPort(BaseGeoIPServicePort);
       		BaseGeoIPServicePort.endpointURI = "http://www.webservicex.net/geoipservice.asmx";
       		if(this.endpointURI == null)
       		{
       			this.endpointURI = BaseGeoIPServicePort.endpointURI; 
       		} 
       		
			var requestMessage:WSDLMessage;
			var responseMessage:WSDLMessage;
			//define the WSDLOperation: new WSDLOperation(methodName)
            var getGeoIPContext:WSDLOperation = new WSDLOperation("GetGeoIPContext");
				//input message for the operation
    	        requestMessage = new WSDLMessage("GetGeoIPContext");
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://www.webservicex.net";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("GetGeoIPContextResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://www.webservicex.net","GetGeoIPContextResult"),null,new QName("http://www.webservicex.net","GeoIP")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://www.webservicex.net";
                responseMessage.encoding.useStyle="literal";				
				
	            responseMessage.isWrapped = true;
	            responseMessage.wrappedQName = new QName("http://www.webservicex.net","GetGeoIPContextResponse");
			getGeoIPContext.inputMessage = requestMessage;
	        getGeoIPContext.outputMessage = responseMessage;
            getGeoIPContext.schemaManager = this.schemaMgr;
            getGeoIPContext.soapAction = "http://www.webservicex.net/GetGeoIPContext";
            getGeoIPContext.style = "document";
            BaseGeoIPServiceService.getPort("BaseGeoIPServicePort").binding.portType.addOperation(getGeoIPContext);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var getGeoIP:WSDLOperation = new WSDLOperation("GetGeoIP");
				//input message for the operation
    	        requestMessage = new WSDLMessage("GetGeoIP");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://www.webservicex.net","IPAddress"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://www.webservicex.net";
			requestMessage.encoding.useStyle="literal";
	            requestMessage.isWrapped = true;
	            requestMessage.wrappedQName = new QName("http://www.webservicex.net","GetGeoIP");
                
                responseMessage = new WSDLMessage("GetGeoIPResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://www.webservicex.net","GetGeoIPResult"),null,new QName("http://www.webservicex.net","GeoIP")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://www.webservicex.net";
                responseMessage.encoding.useStyle="literal";				
				
	            responseMessage.isWrapped = true;
	            responseMessage.wrappedQName = new QName("http://www.webservicex.net","GetGeoIPResponse");
			getGeoIP.inputMessage = requestMessage;
	        getGeoIP.outputMessage = responseMessage;
            getGeoIP.schemaManager = this.schemaMgr;
            getGeoIP.soapAction = "http://www.webservicex.net/GetGeoIP";
            getGeoIP.style = "document";
            BaseGeoIPServiceService.getPort("BaseGeoIPServicePort").binding.portType.addOperation(getGeoIP);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://www.webservicex.net","GeoIP"),net.webservicex.GeoIP);
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 
		 * @return Asynchronous token
		 */
		public function getGeoIPContext():AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            currentOperation = BaseGeoIPServiceService.getPort("BaseGeoIPServicePort").binding.portType.getOperation("GetGeoIPContext");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param IPAddress
		 * @return Asynchronous token
		 */
		public function getGeoIP(iPAddress:String):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["IPAddress"] = iPAddress;
	            currentOperation = BaseGeoIPServiceService.getPort("BaseGeoIPServicePort").binding.portType.getOperation("GetGeoIP");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
        /**
         * Performs the actual call to the remove server
         * It SOAP-encodes the message using the schema and WSDL operation options set above and then calls the server using 
         * an async invoker
         * It also registers internal event handlers for the result / fault cases
         * @private
         */
        private function call(operation:WSDLOperation,args:Object,token:AsyncToken,headers:Array=null):void
        {
	    	var enc:SOAPEncoder = new SOAPEncoder();
	        var soap:Object = new Object;
	        var message:SOAPMessage = new SOAPMessage();
	        enc.wsdlOperation = operation;
	        soap = enc.encodeRequest(args,headers);
	        message.setSOAPAction(operation.soapAction);
	        message.body = soap.toString();
	        message.url=endpointURI;
            var inv:AsyncRequest = new AsyncRequest();
            inv.destination = super.destination;
            //we need this to handle multiple asynchronous calls 
            var wrappedData:Object = new Object();
            wrappedData.operation = currentOperation;
            wrappedData.returnToken = token;
            if(!this.useProxy)
            {
            	var dcs:ChannelSet = new ChannelSet();	
	        	dcs.addChannel(new DirectHTTPChannel("direct_http_channel"));
            	inv.channelSet = dcs;
            }                
            var processRes:AsyncResponder = new AsyncResponder(processResult,faultResult,wrappedData);
            inv.invoke(message,processRes);
		}
        
        /**
         * Internal event handler to process a successful operation call from the server
         * The result is decoded using the schema and operation settings and then the events get passed on to the actual facade that the user employs in the application 
         * @private
         */
		private function processResult(result:Object,wrappedData:Object):void
           {
           		var headers:Object;
           		var token:AsyncToken = wrappedData.returnToken;
                var currentOperation:WSDLOperation = wrappedData.operation;
                var decoder:SOAPDecoder = new SOAPDecoder();
                decoder.resultFormat = "object";
                decoder.headerFormat = "object";
                decoder.multiplePartsFormat = "object";
                decoder.ignoreWhitespace = true;
                decoder.makeObjectsBindable=false;
                decoder.wsdlOperation = currentOperation;
                decoder.schemaManager = currentOperation.schemaManager;
                var body:Object = result.message.body;
                var stringResult:String = String(body);
                if(stringResult == null  || stringResult == "")
                	return;
                var soapResult:SOAPResult = decoder.decodeResponse(result.message.body);
                if(soapResult.isFault)
                {
	                var faults:Array = soapResult.result as Array;
	                for each (var soapFault:Fault in faults)
	                {
		                var soapFaultEvent:FaultEvent = FaultEvent.createEvent(soapFault,token,null);
		                token.dispatchEvent(soapFaultEvent);
	                }
                } else {
	                result = soapResult.result;
	                headers = soapResult.headers;
	                var event:ResultEvent = ResultEvent.createEvent(result,token,null);
	                event.headers = headers;
	                token.dispatchEvent(event);
                }
           }
           	/**
           	 * Handles the cases when there are errors calling the operation on the server
           	 * This is not the case for SOAP faults, which is handled by the SOAP decoder in the result handler
           	 * but more critical errors, like network outage or the impossibility to connect to the server
           	 * The fault is dispatched upwards to the facade so that the user can do something meaningful 
           	 * @private
           	 */
			private function faultResult(error:MessageFaultEvent,token:Object):void
			{
				//when there is a network error the token is actually the wrappedData object from above	
				if(!(token is AsyncToken))
					token = token.returnToken;
				token.dispatchEvent(new FaultEvent(FaultEvent.FAULT,true,true,new Fault(error.faultCode,error.faultString,error.faultDetail)));
			}
		}
	}

	import mx.rpc.AsyncToken;
	import mx.rpc.AsyncResponder;
	import mx.rpc.wsdl.WSDLBinding;
                
    /**
     * Internal class to handle multiple operation call scheduling
     * It allows us to pass data about the operation being encoded / decoded to and from the SOAP encoder / decoder units. 
     * @private
     */
    class PendingCall
    {
		public var args:*;
		public var headers:Array;
		public var token:AsyncToken;
		
		public function PendingCall(args:Object, headers:Array=null)
		{
			this.args = args;
			this.headers = headers;
			this.token = new AsyncToken(null);
		}
	}