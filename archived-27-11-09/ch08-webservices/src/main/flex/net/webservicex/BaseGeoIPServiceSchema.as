package net.webservicex
{
	 import mx.rpc.xml.Schema
	 public class BaseGeoIPServiceSchema
	{
		 public var schemas:Array = new Array();
		 public var targetNamespaces:Array = new Array();
		 public function BaseGeoIPServiceSchema():void
		{
			 var xsdXML0:XML = <s:schema xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:tns="http://www.webservicex.net" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" attributeFormDefault="unqualified" elementFormDefault="qualified" targetNamespace="http://www.webservicex.net">
    <s:element name="GetGeoIPContext">
        <s:complexType/>
    </s:element>
    <s:element name="GetGeoIPContextResponse">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="GetGeoIPContextResult" type="tns:GeoIP"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:complexType name="GeoIP">
        <s:sequence>
            <s:element name="ReturnCode" type="s:int"/>
            <s:element minOccurs="0" name="IP" type="s:string"/>
            <s:element minOccurs="0" name="ReturnCodeDetails" type="s:string"/>
            <s:element minOccurs="0" name="CountryName" type="s:string"/>
            <s:element minOccurs="0" name="CountryCode" type="s:string"/>
        </s:sequence>
    </s:complexType>
    <s:element name="GetGeoIP">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="IPAddress" type="s:string"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:element name="GetGeoIPResponse">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="GetGeoIPResult" type="tns:GeoIP"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:element name="GeoIP" nillable="true" type="tns:GeoIP"/>
</s:schema>
;
			 var xsdSchema0:Schema = new Schema(xsdXML0);
			schemas.push(xsdSchema0);
			targetNamespaces.push(new Namespace('','http://www.webservicex.net'));
		}
	}
}