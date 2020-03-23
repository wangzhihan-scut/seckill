create database seckill;
use seckill;

-- 库存表
create table if not exists `seckill`(
`seckill_id` int not null auto_increment comment '商品id',
`name` varchar(120) not null comment '商品名称',
`number` int not null comment '商品数量',
`start_time` timestamp not null comment '秒杀开始时间',
`end_time` timestamp not null comment '秒杀结束时间',
`create_time` timestamp not null default current_timestamp comment '创建时间',

primary key(`seckill_id`),
key idx_start_time(`start_time`),
key idx_end_time(`end_time`),
key idx_create_time(`create_time`)
)engine=InnoDB auto_increment=1000 default charset=utf8 comment='秒杀库存表';

insert seckill (name, number, start_time, end_time)
values
('1000元秒杀iphoneX', 100, '2020-03-22 00:00:00', '2020-03-23 00:00:00'),
('1000元秒杀小米10', 100, '2020-03-23 00:00:00', '2020-03-24 00:00:00'),
('2元秒杀小米耳机', 500, '2020-03-22 00:00:00', '2020-03-23 00:00:00'),
('100元秒杀小米平板', 500, '2020-03-22 00:00:00', '2020-03-23 00:00:00');

--秒杀成功明细表
create table if not exists `success_killed`(
`seckill_id` int not null comment '商品id',
`user_phone` varchar(15) not null comment '用户手机号',
`state` tinyint not null default -1 comment '状态表示：-1：无效 0：成功 1：已付款 2：已发货',
`create_time` timestamp not null comment '创建时间',

primary key(`seckill_id`, `user_phone`),  /* 联合主键 */
key idx_create_time(`create_time`)
)engine=InnoDB default charset=utf8 comment='秒杀库存表';