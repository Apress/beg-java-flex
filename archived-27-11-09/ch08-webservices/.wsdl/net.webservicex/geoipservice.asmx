<?xml version="1.0" encoding="UTF-8"?><wsdl:definitions xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:tns="http://www.webservicex.net" targetNamespace="http://www.webservicex.net">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://www.webservicex.net">
      <s:element name="GetGeoIPContext">
        <s:complexType/>
      </s:element>
      <s:element name="GetGeoIPContextResponse">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="GetGeoIPContextResult" type="tns:GeoIP"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GeoIP">
        <s:sequence>
          <s:element maxOccurs="1" minOccurs="1" name="ReturnCode" type="s:int"/>
          <s:element maxOccurs="1" minOccurs="0" name="IP" type="s:string"/>
          <s:element maxOccurs="1" minOccurs="0" name="ReturnCodeDetails" type="s:string"/>
          <s:element maxOccurs="1" minOccurs="0" name="CountryName" type="s:string"/>
          <s:element maxOccurs="1" minOccurs="0" name="CountryCode" type="s:string"/>
        </s:sequence>
      </s:complexType>
      <s:element name="GetGeoIP">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="IPAddress" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetGeoIPResponse">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="GetGeoIPResult" type="tns:GeoIP"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GeoIP" nillable="true" type="tns:GeoIP"/>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetGeoIPSoapOut">
    <wsdl:part element="tns:GetGeoIPResponse" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="GetGeoIPSoapIn">
    <wsdl:part element="tns:GetGeoIP" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="GetGeoIPContextSoapOut">
    <wsdl:part element="tns:GetGeoIPContextResponse" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="GetGeoIPContextHttpPostOut">
    <wsdl:part element="tns:GeoIP" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="GetGeoIPContextHttpPostIn">
  </wsdl:message>
  <wsdl:message name="GetGeoIPContextHttpGetOut">
    <wsdl:part element="tns:GeoIP" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="GetGeoIPHttpPostOut">
    <wsdl:part element="tns:GeoIP" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="GetGeoIPContextHttpGetIn">
  </wsdl:message>
  <wsdl:message name="GetGeoIPHttpGetOut">
    <wsdl:part element="tns:GeoIP" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="GetGeoIPHttpGetIn">
    <wsdl:part name="IPAddress" type="s:string">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="GetGeoIPHttpPostIn">
    <wsdl:part name="IPAddress" type="s:string">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="GetGeoIPContextSoapIn">
    <wsdl:part element="tns:GetGeoIPContext" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:portType name="GeoIPServiceSoap">
    <wsdl:operation name="GetGeoIPContext">
<wsdl:documentation>GeoIPService - GetGeoIPContext enables you to easily look up countries by Context  </wsdl:documentation>
      <wsdl:input message="tns:GetGeoIPContextSoapIn">
    </wsdl:input>
      <wsdl:output message="tns:GetGeoIPContextSoapOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGeoIP">
<wsdl:documentation>GeoIPService - GetGeoIP enables you to easily look up countries by IP addresses </wsdl:documentation>
      <wsdl:input message="tns:GetGeoIPSoapIn">
    </wsdl:input>
      <wsdl:output message="tns:GetGeoIPSoapOut">
    </wsdl:output>
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="GeoIPServiceHttpGet">
    <wsdl:operation name="GetGeoIPContext">
<wsdl:documentation>GeoIPService - GetGeoIPContext enables you to easily look up countries by Context  </wsdl:documentation>
      <wsdl:input message="tns:GetGeoIPContextHttpGetIn">
    </wsdl:input>
      <wsdl:output message="tns:GetGeoIPContextHttpGetOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGeoIP">
<wsdl:documentation>GeoIPService - GetGeoIP enables you to easily look up countries by IP addresses </wsdl:documentation>
      <wsdl:input message="tns:GetGeoIPHttpGetIn">
    </wsdl:input>
      <wsdl:output message="tns:GetGeoIPHttpGetOut">
    </wsdl:output>
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="GeoIPServiceHttpPost">
    <wsdl:operation name="GetGeoIPContext">
<wsdl:documentation>GeoIPService - GetGeoIPContext enables you to easily look up countries by Context  </wsdl:documentation>
      <wsdl:input message="tns:GetGeoIPContextHttpPostIn">
    </wsdl:input>
      <wsdl:output message="tns:GetGeoIPContextHttpPostOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGeoIP">
<wsdl:documentation>GeoIPService - GetGeoIP enables you to easily look up countries by IP addresses </wsdl:documentation>
      <wsdl:input message="tns:GetGeoIPHttpPostIn">
    </wsdl:input>
      <wsdl:output message="tns:GetGeoIPHttpPostOut">
    </wsdl:output>
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="GeoIPServiceSoap" type="tns:GeoIPServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http"/>
    <wsdl:operation name="GetGeoIPContext">
      <soap:operation soapAction="http://www.webservicex.net/GetGeoIPContext" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGeoIP">
      <soap:operation soapAction="http://www.webservicex.net/GetGeoIP" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="GeoIPServiceHttpGet" type="tns:GeoIPServiceHttpGet">
    <http:binding verb="GET"/>
    <wsdl:operation name="GetGeoIPContext">
      <http:operation location="/GetGeoIPContext"/>
      <wsdl:input>
        <http:urlEncoded/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGeoIP">
      <http:operation location="/GetGeoIP"/>
      <wsdl:input>
        <http:urlEncoded/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="GeoIPServiceHttpPost" type="tns:GeoIPServiceHttpPost">
    <http:binding verb="POST"/>
    <wsdl:operation name="GetGeoIPContext">
      <http:operation location="/GetGeoIPContext"/>
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded"/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGeoIP">
      <http:operation location="/GetGeoIP"/>
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded"/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="GeoIPServiceSoap12" type="tns:GeoIPServiceSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http"/>
    <wsdl:operation name="GetGeoIPContext">
      <soap12:operation soapAction="http://www.webservicex.net/GetGeoIPContext" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGeoIP">
      <soap12:operation soapAction="http://www.webservicex.net/GetGeoIP" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="GeoIPService">
    <wsdl:port binding="tns:GeoIPServiceSoap" name="GeoIPServiceSoap">
      <soap:address location="http://www.webservicex.net/geoipservice.asmx"/>
    </wsdl:port>
    <wsdl:port binding="tns:GeoIPServiceHttpPost" name="GeoIPServiceHttpPost">
      <http:address location="http://www.webservicex.net/geoipservice.asmx"/>
    </wsdl:port>
    <wsdl:port binding="tns:GeoIPServiceHttpGet" name="GeoIPServiceHttpGet">
      <http:address location="http://www.webservicex.net/geoipservice.asmx"/>
    </wsdl:port>
    <wsdl:port binding="tns:GeoIPServiceSoap12" name="GeoIPServiceSoap12">
      <soap12:address location="http://www.webservicex.net/geoipservice.asmx"/>
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>