# encoding: utf-8
#
# Licensed to the Software Freedom Conservancy (SFC) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The SFC licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

require_relative 'spec_helper'

describe 'Desired Capabilities' do
  compliant_on :browser => [:ie] do

    after(:each) do
      @driver.quit unless @driver.nil?
    end

    it 'should not accept camel cased capabilities' do
      expect { Selenium::WebDriver.for(:ie, :nativeEvents => false) }.to raise_error(ArgumentError, /unknown option/)
      expect { Selenium::WebDriver.for(:ie, :nativeEvents => true) }.to raise_error(ArgumentError, /unknown option/)
    end

    it 'should accept snake cased native_events false' do
      @driver = Selenium::WebDriver.for(:ie, :native_events => false)
      expect(@driver.capabilities[:native_events]).to eq false
    end

    it 'should accept snake cased native_events true' do
      @driver = Selenium::WebDriver.for(:ie, :native_events => true)
      expect(@driver.capabilities[:native_events]).to eq true
    end

    context 'when using desired capabilities' do
      context 'and only one capability' do
        it 'should accept capabilities that are camel cased and false' do
          pending 'this should return false'
          caps = Selenium::WebDriver::Remote::Capabilities.ie(:nativeEvents => false)
          @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
          expect(@driver.capabilities[:native_events]).to eq false
        end

        it 'should accept capabilities that are camel cased and true' do
          caps = Selenium::WebDriver::Remote::Capabilities.ie(:nativeEvents => true)
          @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
          expect(@driver.capabilities[:native_events]).to eq true
        end

        it 'should accept capabilities that are snake cased and false' do
          pending 'this should return false'
          caps = Selenium::WebDriver::Remote::Capabilities.ie(:native_events => false)
          @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
          expect(@driver.capabilities[:native_events]).to eq false
        end
      end

      context 'with multiple capabilities' do
        it 'should send desired_capabilities where nativeEvents false and requireWindowFocus true' do
          pending ':native_events returns true'
          caps = Selenium::WebDriver::Remote::Capabilities.ie(
            :nativeEvents => false,
            :requireWindowFocus => true
          )
          @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
          expect(@driver.capabilities['requireWindowFocus']).to eq true
          expect(@driver.capabilities[:native_events]).to eq false
        end

        it 'should send desired_capabilities where nativeEvents true and requireWindowFocus true' do
          caps = Selenium::WebDriver::Remote::Capabilities.ie(
            :nativeEvents => true,
            :requireWindowFocus => true
          )
          @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
          expect(@driver.capabilities['requireWindowFocus']).to eq true
          expect(@driver.capabilities[:native_events]).to eq true
        end

        it 'should send desired_capabilities where native_events false and requireWindowFocus false' do
          pending ':native_events returns true'
          caps = Selenium::WebDriver::Remote::Capabilities.ie(
            :native_events => false,
            :requireWindowFocus => false
          )
          @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
          expect(@driver.capabilities['requireWindowFocus']).to eq false
          expect(@driver.capabilities[:native_events]).to eq false
        end

        it 'should send desired_capabilities where native_events true and requireWindowFocus false' do
          caps = Selenium::WebDriver::Remote::Capabilities.ie(
            :native_events => true,
            :requireWindowFocus => false
          )
          @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
          expect(@driver.capabilities['requireWindowFocus']).to eq false
          expect(@driver.capabilities[:native_events]).to eq true
        end

        it 'should send desired_capabilities where native_events false and requireWindowFocus true' do
          pending 'native_events returns true'
          caps = Selenium::WebDriver::Remote::Capabilities.ie(
            :native_events => false,
            :requireWindowFocus => true
          )
          @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
          expect(@driver.capabilities['requireWindowFocus']).to eq true
          expect(@driver.capabilities[:native_events]).to eq false
        end

        it 'should send desired_capabilities where native_events true and requireWindowFocus true' do
          caps = Selenium::WebDriver::Remote::Capabilities.ie(
            :native_events => true,
            :requireWindowFocus => true
          )
          @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
          expect(@driver.capabilities['requireWindowFocus']).to eq true
          expect(@driver.capabilities[:native_events]).to eq true
        end
      end
    end
  end
end

