// Licensed to the Software Freedom Conservancy (SFC) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The SFC licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

package org.openqa.grid.internal.utils;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.openqa.grid.common.RegistrationRequest;

public class GridHubConfigurationTest {

  @Test
  public void testGetTimeout() throws Exception {
    GridHubConfiguration gridHubConfiguration = new GridHubConfiguration();
    assertEquals(300000, gridHubConfiguration.getTimeout()); // From DefaultHub.json file
    gridHubConfiguration.setTimeout(123);
    assertEquals(123, gridHubConfiguration.getTimeout());
    assertEquals(123,gridHubConfiguration.getAllParams().get(RegistrationRequest.TIME_OUT));
  }

  @Test
  public void testGetBrowserTimeout() throws Exception {
    GridHubConfiguration gridHubConfiguration = new GridHubConfiguration();
    assertEquals(0, gridHubConfiguration.getBrowserTimeout());// From DefaultHub.json file
    gridHubConfiguration.setBrowserTimeout(1233);
    assertEquals(1233, gridHubConfiguration.getBrowserTimeout());
    assertEquals(1233,gridHubConfiguration.getAllParams().get(RegistrationRequest.BROWSER_TIME_OUT));

  }

  @Test
  public void commandLineParsing() throws Exception {
    GridHubConfiguration gridHubConfiguration = new GridHubConfiguration();
    String[] args = "-timeout 32123 -browserTimeout 456".split(" ");
    gridHubConfiguration.loadFromCommandLine(args);
    assertEquals(32123000, gridHubConfiguration.getTimeout());
    assertEquals(456000, gridHubConfiguration.getBrowserTimeout());
  }
}
