import { App } from '@tinyhttp/app';
import { logger } from '@tinyhttp/logger';

const app = new App();
app.use(logger());

app.get('/ping', async (req, res) => {
  try {
    res.send({
      message: 'pong',
    });
  } catch (err) {
    res.send({
      error: err,
    });
  }
});

app.listen(4000, () => {
  console.log('Hello, World');
});
