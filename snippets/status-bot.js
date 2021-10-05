const {execSync} = require('child_process');
const os = require('os');

const npmRoot = run("npm root -g")
const { Telegraf } = require(`${npmRoot}/telegraf`);

function run(command) {
	return execSync(command, {encoding: 'utf8'}).toString().trim();
}

function getConfig() {
	const config = run('ssh bob-local cat config.json')
	return JSON.parse(config).messageInterface;
}

const findUptime = /up (.*?),/;
function uptime() {
	const uptimeResult = findUptime.exec(run('uptime'));
	return uptimeResult[1];
}

const findSpace = /(\d{0,3}%) \/\n/;
function diskSpace() {
	const spaceResult = findSpace.exec(run('df'));
	return spaceResult[1];
}

function start() {
	const config = getConfig();

	console.log(`${new Date()} connecting to telegram`);

	const bot = new Telegraf(config.botTokens[os.hostname()]);

	bot.start(ctx => ctx.reply('Welcome'));
	bot.launch();

	const chatIdWhitelist = Object.values(config.chats);

	bot.telegram.sendMessage(config.chats.bots, 'started up');

	bot.on('text', async ctx => {
		console.log('Message received');
		console.log(`Chat: ${ctx.update.message.chat.first_name || ctx.update.message.chat.title} - ${ctx.update.message.chat.id}`);
		console.log(`From: ${ctx.update.message.from.first_name} - ${ctx.update.message.from.id}`);
		console.log(`Text: ${ctx.update.message.text}`);

		if (!chatIdWhitelist.includes(ctx.update.message.chat.id)) {
			console.log('Message from unknown chat, ignoring');
			return;
		}

		if (Date.now() / 1000 - ctx.update.message.date > 60) {
			console.log('Message older than a minute, ignoring');
			return;
		}

		if (ctx.update.message.text.toLowerCase().includes('status')) {
			ctx.reply('👀'); // don't post if another has ?

			await new Promise(resolve => setTimeout(resolve, Math.random() * 5000));

			ctx.reply(`uptime: ${uptime()}, disk space: ${diskSpace()}`);
		}
	});
}

start(); // add if to check if it's started by another process?

process.on('unhandledRejection', error => {
	console.log(`failed: ${error}`);
	// start(); // careful, messages are backed up so this will result in quite a few
});
