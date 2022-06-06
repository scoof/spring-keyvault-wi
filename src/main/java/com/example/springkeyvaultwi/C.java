package com.example.springkeyvaultwi;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class C {

  @Value("${my-secret}")
  private String secret;

  @GetMapping(path="/")
  public String get() {
    return secret;
  }
}
