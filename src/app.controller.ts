import { Controller, Get, Redirect } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) { }

  @Get()
  @Redirect('/index.html', 301)
  getHello(): string {
    return this.appService.getHello();
  }
}
