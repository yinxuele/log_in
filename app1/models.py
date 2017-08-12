from django.db import models

TYPE_CHOICES = (
        (u'通用测试设备', u'通用测试设备'),
        (u'机载测试设备', u'机载测试设备'),
        (u'改装装机设备', u'改装装机设备'),
        (u'一般耗材', u'一般耗材'),
        (u'电连接器', u'电连接器'),
        (u'改装标准件', u'改装标准件'),
        (u'非标件', u'非标件'),
        (u'成品线缆', u'成品线缆'),
        (u'系统物资', u'系统物资'),
    )
STATE_CHOICES = (
        (u'在库', u'在库'),
        (u'出库', u'出库'),
        (u'送校', u'送校'),
        (u'故障', u'故障'),
        (u'停用', u'停用'),
    )

STORAGEROOM_CHOICES = (
    (u'主库房', u'主库房'),
    (u'装机库房', u'装机库房'),
    (u'隔离库房', u'隔离库房'),
)
class Materials(models.Model):
    name = models.CharField('物资名称',max_length=20)
    type = models.CharField('物资类型',max_length=10,choices=TYPE_CHOICES)
    modelNum = models.CharField('物资型号', max_length=20)
    storoomNum = models.CharField('库房编号',max_length=20)
    state = models.CharField('库存状态', max_length=10,choices=STATE_CHOICES)
    number = models.IntegerField('库存数量',null=True,blank=True)
    location = models.CharField('存放地点', max_length=10)
    department = models.CharField('维护科室', max_length=10)
    meteringNum = models.CharField('计量编号', max_length=20)
    usefulLife = models.DateField('有效期限',null=True,blank=True)
    serialNum = models.CharField('出厂编号', max_length=20)
    countingUnit = models.CharField('计数单位', max_length=5)
    coreNum = models.IntegerField('芯数',null=True,blank=True)
    measurement = models.CharField('度量单位', max_length=5)
    mountingNum = models.CharField('装机件号', max_length=20)
    threshold = models.IntegerField('阈值',null=True,blank=True)   # 需要自己定义一个值
    remarks = models.TextField('备注')

    def __str__(self):
        return self.name

class Staff(models.Model):
    name = models.CharField('姓名',max_length=10)
    jobNum = models.CharField('工号',max_length=10)
    department = models.CharField('科室',max_length=10)
    email = models.EmailField('邮箱')
    tel = models.CharField('电话',max_length=15)
    password = models.CharField('密码',max_length=15)
    remarks = models.TextField('备注')

    def __str__(self):
        return self.name

class StorageLocation(models.Model):
    location = models.CharField('存放地点', max_length=60)
    remarks = models.TextField('备注')

    def __str__(self):
        return self.location

class StorageRegion(models.Model):
    region = models.CharField('存放区域',max_length=10)
    remarks = models.TextField('备注')

    def __str__(self):
        return self.region

class MaterialType(models.Model):
    matType = models.CharField('物资类型',max_length=10)
    remarks = models.TextField('备注')

    def __str__(self):
        return self.matType

class StorageState(models.Model):
    storState = models.CharField('库存状态',max_length=10)
    remarks = models.TextField('备注')

    def __str__(self):
        return self.storState

class EntryManagement(models.Model):
    SOURCE_CHOICES=(
        (u'本单位采购',u'本单位采购'),
        (u'外单位借入', u'外单位借入'),
        (u'故障处理', u'故障处理'),
        (u'装机计划', u'装机计划'),
    )
    DEPARTMENT_CHOICES = (
        (u'C919团队', u'C919团队'),
        (u'ARJ团队', u'ARJ团队'),
        (u'试飞运行部', u'试飞运行部'),
        (u'试飞工程部', u'试飞工程部'),
    )

    formNum_en = models.CharField('入库单号',max_length=20)
    operator_en = models.CharField('入库经办人',max_length=10)
    entryDate_en =  models.DateField('入库日期',null=True,blank=True)
    source = models.CharField('入库物品来源',max_length=15,choices=SOURCE_CHOICES)
    department_en = models.CharField('采购科室/部门/外单位名称',max_length=15,choices=DEPARTMENT_CHOICES)
    type = models.CharField('入库物品类型',max_length=10,choices=TYPE_CHOICES)
    storageroom = models.CharField('所属库房',max_length=10,choices=STORAGEROOM_CHOICES)
    manager = models.CharField('库房管理员', max_length=10)
    materialName = models.CharField('物资名称', max_length=20)
    modelNum = models.CharField('物资型号',max_length=20)
    serialNum = models.CharField('出厂编号', max_length=20)
    storoomNum_en= models.CharField('库房编号',max_length=20)
    entryNum = models.IntegerField('入库数量',null=True,blank=True)
    remarks = models.TextField('备注')

    def __str__(self):
        return self.formNum_en

class DeliveryManagement(models.Model):
    REASON_CHOICES = (
        (u'实验室试验', u'实验室试验'),
        (u'项目实施', u'项目实施'),
        (u'临时借用', u'临时借用'),
        (u'送检校准', u'送检校准'),
        (u'外单位借出', u'外单位借出'),
        (u'检查维修', u'检查维修'),
        (u'装机', u'装机'),
    )

    formNum_de = models.CharField('出库单号', max_length=20)
    operator_de = models.CharField('出库经办人', max_length=10)
    deliveryDate = models.DateField('出库日期',null=True,blank=True)
    reason = models.CharField('出库事由',max_length=15,choices=REASON_CHOICES)
    department = models.CharField('领用部门/团队/科室/外单位名称',max_length=15)
    type = models.CharField('出库物品类型',max_length=10,choices=TYPE_CHOICES)
    storageroom = models.CharField('所属库房',max_length=10,choices=STORAGEROOM_CHOICES)
    manager = models.CharField('库房管理员', max_length=10)
    materialName = models.CharField('物资名称', max_length=20)
    modelNum = models.CharField('物资型号', max_length=20)
    storoomNum = models.CharField('库房编号', max_length=20)
    deliveryState = models.CharField('出库品状态', max_length=10)
    deliveryNum = models.IntegerField('出库数量',null=True,blank=True)
    returnDemand = models.CharField('还库需求', max_length=10)
    remarks = models.TextField('备注')

    def __str__(self):
        return self.formNum_de

class ReturnManagement(models.Model):
    formNum_de = models.CharField('出库单号', max_length=20)
    operator_re = models.CharField('还库经办人', max_length=10)
    deliveryDate = models.DateField('出库日期',null=True,blank=True)
    returnDate = models.DateField('还库日期',null=True,blank=True)
    type = models.CharField('出库物品类型',max_length=10,choices=TYPE_CHOICES)
    storageroom = models.CharField('所属库房',max_length=10,choices=STORAGEROOM_CHOICES)
    manager = models.CharField('库房管理员', max_length=10)
    materialName = models.CharField('物资名称', max_length=20)
    modelNum = models.CharField('物资型号', max_length=20)
    storoomNum = models.CharField('库房编号', max_length=20)
    returnState = models.CharField('还库品状态', max_length=10)
    attachState = models.CharField('附件状态', max_length=10)
    returnNum = models.IntegerField('还库数量',null=True,blank=True)
    remarks = models.TextField('备注')

    def __str__(self):
        return self.formNum_de

